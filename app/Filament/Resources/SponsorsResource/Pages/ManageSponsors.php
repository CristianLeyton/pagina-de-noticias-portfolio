<?php

namespace App\Filament\Resources\SponsorsResource\Pages;

use App\Filament\Resources\SponsorsResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageSponsors extends ManageRecords
{
    protected static string $resource = SponsorsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
