<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sectored extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'sector_name'
    ];
    public    $timestamps    = false;
    protected $table  = 'hire_sectors';


}
