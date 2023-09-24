<?php

namespace App\Http\Controllers;

use App\Models\Karyawan;
use Illuminate\Http\Request;

class KaryawanController extends Controller
{
    public function index(Request $request)
    {
        $pages = 'karyawan';
        $items = Karyawan::orderBy('nama', 'asc')->get();
        return view('pages.admin.karyawan.index', compact('items', 'request', 'pages'));
    }

    public function create()
    {
        $pages = 'karyawan';
        return view('pages.admin.karyawan.create', compact('pages'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate(
            [
                'nama'        => 'required',
                'jk'          => 'required',
                'telp'        => 'required',
                'alamat'      => 'required',
                'no_rekening' => 'required',
                'bank'        => 'required',
            ],
            [
                'nama.required'        => 'Nama harus diisi',
                'jk.required'          => 'Jenis Kelamin harus diisi',
                'telp.required'        => 'Telp harus diisi',
                'alamat.required'      => 'Alamat harus diisi',
                'no_rekening.required' => 'No Rekening harus diisi',
                'bank.required'        => 'Bank harus diisi',
            ]
        );
        $validated['created_by'] = auth()->user()->id;
        $validated['updated_by'] = auth()->user()->id;

        Karyawan::create($validated);
        return redirect()->route('admin.karyawan')->with('status', 'Data berhasil tambahkan!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }

    public function edit(Karyawan $item)
    {
        $pages = 'karyawan';
        return view('pages.admin.karyawan.edit', compact('pages', 'item'));
    }

    public function update(Karyawan $item, Request $request)
    {

        $validated = $request->validate(
            [
                'nama'        => 'required',
                'jk'          => 'required',
                'telp'        => 'required',
                'alamat'      => 'required',
                'no_rekening' => 'required',
                'bank'        => 'required',
            ],
            [
                'nama.required'        => 'Nama harus diisi',
                'jk.required'          => 'Jenis Kelamin harus diisi',
                'telp.required'        => 'Telp harus diisi',
                'alamat.required'      => 'Alamat harus diisi',
                'no_rekening.required' => 'No Rekening harus diisi',
                'bank.required'        => 'Bank harus diisi',
            ]
        );

        $validated['updated_by'] = auth()->user()->id;
        $item->where('id', $item->id)->update($validated);
        return redirect()->route('admin.karyawan')->with('status', 'Data berhasil diubah!')->with('tipe', 'success')->with('icon', 'fas fa-feather');
    }

    public function destroy(Karyawan $item)
    {
        $item->destroy($item->id);
        return redirect()->route('admin.karyawan')->with('status', 'Data berhasil dihapus!')->with('tipe', 'warning')->with('icon', 'fas fa-feather');
    }
}
