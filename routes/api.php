<?php

use App\Http\Controllers\ApiAuth\ApiAuthController;
use App\Http\Controllers\ApiAuth\ApiTaskController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


// Authentication Routes
Route::controller(ApiAuthController::class)->group(function () {
    // Guest Routes
    Route::middleware(['guest'])->group(function () {
        Route::post('register', 'register')->name('api-register.post');
        Route::post('login', 'login')->name('api-login.post');
    });
    // Authenticated User routes
    Route::middleware(['auth:sanctum'])->group(function () {
        // Route::get('me', 'me')->name('me');
        Route::post('logout', 'logout')->name('api-logout.post');
    });
});

// Task Controller
Route::middleware(['auth:sanctum'])->group(function () {

    // Task management Routes Resource Controller
    Route::resource('api-task', ApiTaskController::class);

    // Other task Routes
    Route::controller(ApiTaskController::class)->group(function () {
        Route::get('/user', function (Request $request) {
            return $request->user();
        });
        Route::get('change-status', 'changeStatus')->name('api-changeStatus');
        Route::get('change-due-date', 'changeDueDate')->name('api-changeDueDate');
    });
});
