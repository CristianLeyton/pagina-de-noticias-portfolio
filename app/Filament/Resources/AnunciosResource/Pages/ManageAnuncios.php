<?php

namespace App\Filament\Resources\AnunciosResource\Pages;

use App\Filament\Resources\AnunciosResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageAnuncios extends ManageRecords
{
    protected static string $resource = AnunciosResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
