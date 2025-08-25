<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use Ptdi\Mpub\Transformer\Html;
use Illuminate\Support\Str;
use Ptdi\Mpub\Main\CSDBStatic;
use Illuminate\Support\Facades\Storage;

function generateHTML($url, $csdb_host, $csdb_path, $base, $output)
{
    $html = new Html(
        base_path('resources/xsl/html/main.xsl'), // path ke file XSLT
        $output
    );
    $size = $html->create($url, [
        'base_uri' => $url,
        'csdb_host' => $csdb_host,
        'csdb_path' => $csdb_path,
        'access_key' => '',
        'base' => $base
    ]);
    return $size;
}

function downloadFile($sourceUrl, $destinationUri)
{
    // Set a longer execution time for potentially long downloads
    set_time_limit(0);
    ini_set('max_execution_time', 0);

    // $sourceUrl = 'http://example.com/path/to/large_file.zip'; // URL of the file to download
    // $destinationPath = '/path/to/save/large_file.zip'; // Local path to save the file

    if (!is_dir(dirname($destinationUri))) {
        mkdir(dirname($destinationUri), 0777, true);
    }

    $fp = fopen($destinationUri, 'w+'); // Open file for writing

    if ($fp === false) {
        die("Error: Could not open destination file for writing.");
    }

    $ch = curl_init($sourceUrl);

    // Set cURL options for streaming
    curl_setopt($ch, CURLOPT_FILE, $fp); // Write the output to the file pointer
    curl_setopt($ch, CURLOPT_TIMEOUT, 0); // No timeout for cURL operation
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true); // Follow redirects

    // Execute the cURL session
    $success = curl_exec($ch);

    // Check for cURL errors
    if ($success === false) {
        echo "cURL Error: " . curl_error($ch);
    }

    // Close cURL and the file pointer
    curl_close($ch);
    fclose($fp);

    if ($success) {
        return filesize($destinationUri);
    } else {
        return 0;
    }
}

function deleteDirectory($dir) {
    if (!file_exists($dir)) {
        return true; // Directory does not exist, consider it deleted.
    }

    if (!is_dir($dir)) {
        return unlink($dir); // It's a file, delete it.
    }

    foreach (scandir($dir) as $item) {
        if ($item == '.' || $item == '..') {
            continue;
        }

        if (!deleteDirectory($dir . DIRECTORY_SEPARATOR . $item)) {
            return false; // Failed to delete a child item.
        }
    }

    return rmdir($dir); // Delete the empty directory.
}

class GeneratorHTML extends Generator
{
    public function makeHTML(Request $request, string $filename): \Illuminate\Http\Response
    {
        $csdb_host = $request->get('host') ?? env('CSDB_HOST');
        $csdb_path = $request->get('path') ?? env('CSDB_PATH_TO_FILE');
        $path = str_replace("//", "/", ('/' . $csdb_path . '/' . $filename));

        #1. ubah url file menjadi HTML
        $url = $csdb_host .  $path;
        $htmlfilename = str_replace('.xml', '.html', $filename);
        $output = base_path('storage/app/public/html/' . $htmlfilename);
        $size = generateHTML($url, $csdb_host, $csdb_path, $request->base ?? '', $output);
        #2. kembalikan file HTML
        if ($size) {
            return Response::make(file_get_contents($output), 200, [
                'Content-Type' => 'text/html',
                'Content-Disposition' => 'inline; filename="' . $htmlfilename . '"',
            ]);
        } else {
            return Response::make('Failed to generate HTML', 500, [
                'Content-Type' => 'text/plain',
                'Content-Disposition' => 'inline; filename="' . $filename . '.txt"',
            ]);
        }
    }

    public function makeRepo(Request $request)
    {
        $csdb_host = $request->get('host') ?? env('CSDB_HOST');
        $scan_path = '/scandir';
        $path = $csdb_host . $scan_path;
        $listcsdbobjects = file_get_contents($path);
        if ($listcsdbobjects) {
            $rand = Str::random(5);
            $outputPath = base_path('storage/app/public/html') . "/" . $rand;
            if (!is_dir(dirname($outputPath))) mkdir(dirname($outputPath), 0777, true);
            $listcsdbobjects = json_decode($listcsdbobjects);
            $csdb_path = $request->get('path') ?? env('CSDB_PATH_TO_FILE');
            $repo = [
                "origin" => "https://ferdisap.github.io",
                "base" => "fpub-viewer",
                "path" => "repo/" . $rand,
                "module_extension" => "html",
                "index" => '',
                "indexes" => [],
                "modules" => [],
                "icns" => [],
                "issue_date" => date("M-d-Y"),
                "id" => Str::random(16),
                "parent_id" => $request->parent_id ?? '',
                "customer_id" => $request->customer_id ?? '',
            ];
            // download all
            for ($i = 0; $i < count($listcsdbobjects); $i++) {
                $filename = $listcsdbobjects[$i];
                $temp = $outputPath . "/temp/" . $filename;
                downloadFile($csdb_host . str_replace("//", "/", ($csdb_path . '/' . $filename)), $temp);
            }
            // generate html
            for ($i = 0; $i < count($listcsdbobjects); $i++) {
                $filename = $listcsdbobjects[$i];
                $extension = pathinfo($filename, PATHINFO_EXTENSION);
                $temp = $outputPath . "/temp/" . $filename;
                if ($extension === 'xml' || $extension === 'XML') {
                    $ident = (pathinfo($filename, PATHINFO_FILENAME));
                    $module = [
                        "ident" => $ident,
                    ];
                    // generate HTML
                    $output = $outputPath . "/" . $ident . '.html';
                    generateHTML($temp, $csdb_host, $csdb_path, "fpub-viewer", $output);
                    // filling indexes
                    $dom = new \DOMDocument();
                    $dom->load($temp);
                    $pmType = $dom->documentElement->getAttribute("pmType");
                    if($pmType === 'pt51'){
                        $repo["indexes"]["poh"] = $ident;
                    }
                    elseif($pmType === 'pt52'){
                        $repo["indexes"]["maintPlanning"] = $ident;
                    }
                    elseif($pmType === 'pt53'){
                        $repo["indexes"]["loap"] = $ident;
                        $repo["index"] = $ident;
                    }
                    if ($dom->documentElement) {
                        $xpath = new \DOMXPath($dom);
                        $result = $xpath->evaluate("//identAndStatusSection/descendant::dmTitle | //identAndStatusSection/descendant::pmTitle | //imfIdentAndStatusSection/descendant::icnTitle");
                        if ($result->count() > 0) {
                            $module["title"] = CSDBStatic::resolve_title($result[0]);
                        }
                        $result = $xpath->evaluate("//identAndStatusSection/descendant::issueDate | //imfIdentAndStatusSection/descendant::issueDate");
                        if ($result->count() > 0) {
                            $module["issue_date"] = CSDBStatic::resolve_issueDate($result[0]);
                        }
                    }
                    // filling modules (ident, title, issue_date)
                    array_push($repo["modules"], $module);
                } else {
                    $filename = $listcsdbobjects[$i];
                    // $output = $outputPath . "/" . $filename;
                    // dd($outputPath . "/temp/" . $filename, $outputPath . "/" . $filename);
                    // dd($outputPath . "/temp/" . $filename, $outputPath . "/" . $filename);
                    rename($outputPath . "/temp/" . $filename, $outputPath . "/" . $filename);
                    array_push($repo["icns"], $filename);
                }
            }
            file_put_contents($output = $outputPath . "/repository.json", json_encode($repo));
            deleteDirectory($outputPath . "/temp/" );
        }
    }


    ### script tidak terpakai dibawah ini ###

    /**
     * untuk belajar saja
     */
    public function readFile($url)
    {
        // chmod("extensions_img/test.jpg", 0755);

        // $fullPath = "http://www.website_url.com/extensions_img/test.jpg";
        $fullPath = $url;

        if ($fd = fopen($fullPath, "r")) {

            // $fsize = filesize("extensions_img/test.jpg");

            $path_parts = pathinfo($fullPath);
            $ext = strtolower($path_parts["extension"]);

            switch ($ext) {

                case "pdf":
                    $ctype = "application/pdf";
                    break;
                case "exe":
                    $ctype = "application/octet-stream";
                    break;
                case "zip":
                    $ctype = "application/zip";
                    break;
                case "doc":
                    $ctype = "application/msword";
                    break;
                case "xls":
                    $ctype = "application/vnd.ms-excel";
                    break;
                case "ppt":
                    $ctype = "application/vnd.ms-powerpoint";
                    break;
                case "gif":
                    $ctype = "image/gif";
                    break;
                case "png":
                    $ctype = "image/png";
                    break;
                case "jpeg":
                    $ctype = "image/jpg";
                    break;
                case "jpg":
                    $ctype = "image/jpg";
                    break;
                case "mp3":
                    $ctype = "audio/mp3";
                    break;
                case "wav":
                    $ctype = "audio/x-wav";
                    break;
                case "wma":
                    $ctype = "audio/x-wav";
                    break;
                case "mpeg":
                    $ctype = "video/mpeg";
                    break;
                case "mpg":
                    $ctype = "video/mpeg";
                    break;
                case "mpe":
                    $ctype = "video/mpeg";
                    break;
                case "mov":
                    $ctype = "video/quicktime";
                    break;
                case "avi":
                    $ctype = "video/x-msvideo";
                    break;
                case "src":
                    $ctype = "plain/text";
                    break;
                default:
                    $ctype = "application/force-download";
            }

            header("Pragma: public");

            header("Expires: 0");

            header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

            header("Cache-Control: private", false);

            header("Content-type: " . $ctype);

            header("Content-Disposition: attachment; filename=\"" . $path_parts["basename"] . "\"");

            header("Content-Transfer-Encoding: binary");

            header("Content-length: $fsize");
            header("Cache-control: public"); //use this to open files directly

            while (!feof($fd)) {
                $buffer = fread($fd, 4096);
                flush();
            }
        }
        fclose($fd);
    }
}
