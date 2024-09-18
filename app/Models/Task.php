<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    function assignedTo()
    {
        return $this->belongsTo(User::class, 'assigned_to', 'id');
    }

    function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id');
    }
}
