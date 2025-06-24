<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TerrainController;

Route::get('/', function () {
    return view('welcome');
});

Route::resource('terrains', TerrainController::class);