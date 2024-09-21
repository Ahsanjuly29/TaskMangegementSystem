<?php

use App\Http\Controllers\ApiAuth\ApiAuthController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

Route::controller(ApiAuthController::class)->group(function () {
    Route::post('register', 'register');
    Route::post('login', 'login');
});

Route::middleware(['auth:sanctum'])->group(function () {
    Route::resource('task', TaskController::class);
    Route::get('change-status', [TaskController::class, 'changeStatus']);
    Route::get('change-due-date', [TaskController::class, 'changeDueDate']);

    Route::controller(ApiAuthController::class)->group(function () {
        Route::post('me', 'me');
        Route::post('logout', 'logout');
    });
});
