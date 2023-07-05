<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });


Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::group(['middleware' => ['auth:sanctum']], function () {

    Route::post('/profile', [AuthController::class, 'profile']);
    Route::post('/checkBalance', [AuthController::class, 'checkBalance']);
    Route::post('/deposit', [AuthController::class, 'deposit']);
    Route::post('/withdraw', [AuthController::class, 'withdraw']);
    Route::post('/transaction', [AuthController::class, 'userTransaction']);
    Route::get('/allcustomer', [AuthController::class, 'getallcustomer']);
    Route::post('/logout', [AuthController::class, 'logout']);

});


