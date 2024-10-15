<?php

namespace App\Filament\Resources\NoticiasResource\Pages;

use App\Filament\Resources\NoticiasResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewNoticias extends ViewRecord
{
    protected static string $resource = NoticiasResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
