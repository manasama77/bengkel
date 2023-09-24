<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Gaji;
use App\Models\Karyawan;
use Illuminate\Support\Facades\Auth;

class GajiController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Auth::user()->tipeuser != 'admin') {
                return redirect()->route('dashboard')->with('status', 'Halaman tidak ditemukan!')->with('tipe', 'danger');
            }
            return $next($request);
        });
    }

    public function index(Request $request)
    {
        $pages = 'gaji';
        $items = Gaji::with('karyawan')->latest()->paginate();
        return view('pages.admin.gaji.index', compact('items', 'request', 'pages'));
    }

    public function create()
    {
        $pages = 'gaji';

        $karyawans = Karyawan::orderBy('nama', 'asc')->get();
        return view('pages.admin.gaji.create', compact('pages', 'karyawans'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate(
            [
                'karyawan_id' => 'required',
                'nominal'     => 'required',
            ],
            [
                'karyawan.required' => 'Karyawan harus diisi',
                'nominal.required'  => 'Nominal harus diisi',
            ]
        );
        $validated['created_by'] = auth()->user()->id;
        $validated['updated_by'] = auth()->user()->id;

        Gaji::create($validated);
        return redirect()->route('admin.gaji')->with('status', 'Data berhasil tambahkan!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }
}
