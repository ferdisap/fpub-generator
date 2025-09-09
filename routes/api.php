<?php

use App\Http\Controllers\Exiftool\hotspotController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('/set_hotspots/jpeg', [hotspotController::class, 'setJpegHotspots'])->name('set.hotspot.jpeg');
Route::post('/get_hotspots/jpeg', [hotspotController::class, 'getJpegHotspots'])->name('get.hotspot.jpeg');