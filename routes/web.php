<?php

use App\Http\Controllers\GeneratorHTML;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/generate/html/{filename}', [GeneratorHTML::class, 'makeHTML'])->name('generate.html')->where('filename', '[A-Za-z0-9\-\_\.]+');

Route::get('/make_repo/html', [GeneratorHTML::class, 'makeRepo'])->name('generate.html.repo')->where('filename', '[A-Za-z0-9\-\_\.]+');