<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::group(['prefix' => 'auth', 'namespace' => 'Auth'], function() {
    Route::post('login', 'LoginController@login');
    Route::post('logout', 'LogoutController');
    Route::post('register', 'RegisterController@register');
});

Route::post('get-media', 'MediaController@getMedia')->name('media');
Route::post('set-as-fav', 'MediaController@setMediaFav')->name('set as Fav');
Route::get('history', 'MediaController@getSearchOperations')->name('search_log');
Route::get('favorite', 'MediaController@getFavs')->name('favs');

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/




/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/