<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class Generator extends Controller
{
    public function fetchFileFromCSDB(string $filename)
    {
        return file_get_contents(env('CSDB_HOST') . env('CSDB_PATH_TO_FILE') . $filename);
    }

    public function getCType($filename)
    {
        $ext = strtolower(pathinfo($filename, PATHINFO_EXTENSION));
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
                $ctype = '';
        }
        if (!$ctype) {
            $ctype = mime_content_type($filename);
        } else {
            $ctype = "application/force-download";
        }
        return $ctype;
    }

    /**
     * untuk belajar saja
     */
    private function downloadFile($url, $filename)
    {
        $newfname = $filename;
        $file = fopen($url, 'rb');
        // dd($file);
        if ($file) {
            $newf = fopen($newfname, 'wb');
            if ($newf) {
                while (!feof($file)) {
                    fwrite($newf, fread($file, 1024 * 8), 1024 * 8);
                }
            }
        }
        if ($file) {
            fclose($file);
        }
        if ($newf) {
            fclose($newf);
        }
        // dd($newfname);
        return $newf;
    }
}
