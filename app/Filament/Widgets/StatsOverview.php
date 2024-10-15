<?php

namespace App\Filament\Widgets;

use App\Models\Anuncios;
use App\Models\Images;
use App\Models\Noticias;
use App\Models\Sponsors;
use Filament\Support\Enums\IconPosition;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class StatsOverview extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            //
            Stat::make('Noticias', Noticias::query()->count())
            ->description('Res. recomendada: 854x480')
            ->descriptionIcon('heroicon-o-document-text', IconPosition::Before),
            Stat::make('Sponsors', Sponsors::query()->count())
            ->description('Res. recomendada: 310x175')
            ->descriptionIcon('heroicon-o-sparkles', IconPosition::Before),
            Stat::make('Imagenes', Images::query()->count())
            ->description('Res. recomendada: 896x504')
            ->descriptionIcon('heroicon-o-photo', IconPosition::Before),
            Stat::make('Anuncios', Anuncios::query()->count())
            ->description('Res. recomendada: 1128x123')
            ->descriptionIcon('heroicon-o-megaphone', IconPosition::Before),
        ];
    }
}
