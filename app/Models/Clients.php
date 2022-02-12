<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clients extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'email',
        'nit',
        'address',
        'city',
        'sector_id',
        'id_created',
    ];
    protected $table  = 'hire_clients';
}
