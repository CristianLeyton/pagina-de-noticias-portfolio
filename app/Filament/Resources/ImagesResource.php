<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ImagesResource\Pages;
use App\Filament\Resources\ImagesResource\RelationManagers;
use App\Models\Images;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Infolists;
use Filament\Infolists\Components;
use Filament\Infolists\Infolist;

class ImagesResource extends Resource
{
    protected static ?string $model = Images::class;
    protected static ?string $modelLabel = 'imagen';
    protected static ?string $pluralModelLabel = 'imagenes';
    protected static ?string $navigationIcon = 'heroicon-o-photo';
    protected static ?string $navigationGroup = 'Imagenes';
    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('name')
                ->label('Nombre')
                    ->required()
                    ->maxLength(255),
                Forms\Components\FileUpload::make('image')
                ->label('Imagen')
                    ->image()
                    ->required(),
                    Forms\Components\TextInput::make('link')
                ->label('Link')
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image')
                ->label('Imagen'),
                Tables\Columns\TextColumn::make('name')
                    ->label('Descripción')
                    ->searchable(),
                    Tables\Columns\TextColumn::make('link')
                    ->label('Link')
                    ->toggleable(isToggledHiddenByDefault: false),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Agregado el: ')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label('Editado el: ')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\ViewAction::make(), 
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                Components\Section::make()
                    ->schema([
                        Components\Grid::make(2)
                            ->schema([
                                Components\TextEntry::make('name')
                                    ->label('Descripción'),
                                Components\ImageEntry::make('image')
                                    ->label('Imagen'),
                                    Components\TextEntry::make('link')
                                    ->label('Link'),
                            ]),
                    ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ManageImages::route('/'),
        ];
    }
}
