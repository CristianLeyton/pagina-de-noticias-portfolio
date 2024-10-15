<?php

namespace App\Filament\Resources;

use App\Filament\Resources\NoticiasResource\Pages;
use App\Filament\Resources\NoticiasResource\RelationManagers;
use App\Models\Noticias;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;
use Filament\Infolists\Components;
use Filament\Infolists\Infolist;


class NoticiasResource extends Resource
{
    protected static ?string $model = Noticias::class;
    protected static ?string $modelLabel = 'noticia';
    protected static ?string $pluralModelLabel = 'noticias';
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Publicar';
    protected static ?int $navigationSort = 0;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('title')
                ->label('Título: ')
                ->required()
                ->live(onBlur: true)
                ->maxLength(150)
                ->afterStateUpdated(fn ($state, Forms\Set $set) => $set('slug', Str::slug($state))), // Actualiza siempre el slug al modificar el título
            
            Forms\Components\TextInput::make('slug')
                ->label('Link: ')
                ->disabled()
                ->dehydrated()
                ->required()
                ->maxLength(180)
                ->unique(Noticias::class, 'slug', ignoreRecord: true),

                Forms\Components\MarkdownEditor::make('content')
                    ->label('Cuerpo: ')
                    ->required()
                    ->columnSpan('full')
                    ->disableToolbarButtons([
                        'codeBlock',
                    ]),

                Forms\Components\Textarea::make('short_description')
                    ->label('Descripción corta: ')
                    ->required()
                    ->maxLength(360)
                    ->columnSpan('full'),

                Forms\Components\Section::make('Miniatura: ')
                    ->label('Miniatura: ')
                    ->columnSpan('1')
                    ->schema([
                        Forms\Components\FileUpload::make('image')
                            ->required()
                            ->image()
                            ->hiddenLabel(),
                    ]),


                Forms\Components\DatePicker::make('published_at')
                    ->label('Fecha de publicación: ')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
                Tables\Columns\ImageColumn::make('image')
                    ->label('Imagen'),

                Tables\Columns\TextColumn::make('title')
                    ->searchable()
                    ->sortable()
                    ->label('Título'),

                Tables\Columns\TextColumn::make('short_description')
                    ->label('Descripción corta')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('slug')
                    ->label('Link')
                    ->searchable()
                    ->toggleable(isToggledHiddenByDefault: true),

                Tables\Columns\TextColumn::make('published_at')
                    ->label('Fecha')
                    ->sortable()
                    ->date(),
            ])
            ->filters([
                //
                Tables\Filters\Filter::make('published_at')
                    ->form([
                        Forms\Components\DatePicker::make('published_from')->label('Desde:')
                            ->placeholder(fn($state): string => 'Dec 18, ' . now()->subYear()->format('Y')),
                        Forms\Components\DatePicker::make('published_until')->label('Hasta:')
                            ->placeholder(fn($state): string => now()->format('M d, Y')),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['published_from'] ?? null,
                                fn(Builder $query, $date): Builder => $query->whereDate('published_at', '>=', $date),
                            )
                            ->when(
                                $data['published_until'] ?? null,
                                fn(Builder $query, $date): Builder => $query->whereDate('published_at', '<=', $date),
                            );
                    }),
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

    public static function getRelations(): array
    {
        return [
            //
        ];
    }


    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                Components\Section::make()
                    ->schema([
                        Components\Split::make([
                            Components\Grid::make(2)
                                ->schema([
                                    Components\Group::make([
                                        Components\TextEntry::make('title')
                                        ->label('Título'),
                                        Components\TextEntry::make('slug')
                                        ->label('Link'),
                                    ]),
                                    Components\ImageEntry::make('image')
                                        ->label('Miniatura')
                                        ->grow(false),
                                ]),
                        ]),
                        Components\Split::make([
                            Components\Grid::make(2)
                                ->schema([
                                    Components\Group::make([
                                        Components\TextEntry::make('short_description')
                                            ->label('Descripción corta'),
                                    ]),
                                    Components\Group::make([
                                        Components\TextEntry::make('published_at')
                                            ->label('Fecha de publicación')
                                            ->badge()
                                            ->date()
                                            ->color('success'),
                                    ]),
                                ]),
                        ])->from('lg'),
                    ]),
                Components\Section::make('Cuerpo')
                    ->schema([
                        Components\TextEntry::make('content')
                            ->prose()
                            ->markdown()
                            ->hiddenLabel(),
                    ])
                    ->collapsible(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListNoticias::route('/'),
            'create' => Pages\CreateNoticias::route('/create'),
            'view' => Pages\ViewNoticias::route('/{record}'),
            'edit' => Pages\EditNoticias::route('/{record}/edit'),
        ];
    }
}
