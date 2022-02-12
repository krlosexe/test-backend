<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ClientsContact extends Model
{
    use HasFactory;

    protected $fillable = [
        'client_id',
        'email',
        'name',
    ];
    protected $table      = 'hire_clients_contacts';
    public    $timestamps = false;


}
