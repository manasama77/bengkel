<?php

namespace App\Models;

use Illuminate\Support\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Gaji extends Model
{
    use HasFactory;

    protected $fillable = [
        'karyawan_id',
        'nominal',
    ];

    public function getNominalIndAttribute()
    {
        $nominal = $this->getRawOriginal('nominal');
        return "Rp." . number_format($nominal, 0, ',', '.');
    }

    public function getCreatedAtIndAttribute()
    {
        Carbon::setLocale('id');

        setlocale(LC_ALL, 'id');
        $created_at = $this->getRawOriginal('created_at');
        return Carbon::parse($created_at)->isoFormat("dddd, D MMMM Y HH:mm");
    }

    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class);
    }
}
