<?php

use App\Http\Controllers\NoticiasController;
use App\Http\Controllers\ImagesController;
use App\Http\Controllers\SponsorsController;
use App\Http\Controllers\BannersController;
use App\Http\Controllers\LinksController;
use Filament\Pages\Auth\Login;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/noticias/{slug}', [NoticiasController::class, 'getNotice']);
Route::get('/noticias/', [NoticiasController::class, 'getNoticiasPage']);

Route::get('/api/noticias', ([NoticiasController::class, 'getLasts']))->name('noticias');
Route::get('/api/noticias/paginated', ([NoticiasController::class, 'getPaginatedNoticias']))->name('noticiasPaginated');
Route::get('/api/imagenes', ([ImagesController::class, 'getAll']))->name('imagenes');
Route::get('/api/sponsors', ([SponsorsController::class, 'getAll']))->name('sponsors');
Route::get('/api/anuncios', ([BannersController::class, 'getAll']))->name('banners');
Route::get('/api/links', ([LinksController::class, 'getAll']))->name('links');

