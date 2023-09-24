@extends('layouts.default')

@section('title')
    Karyawan
@endsection

@push('before-script')
    @if (session('status'))
        <x-sweetalertsession tipe="{{ session('tipe') }}" status="{{ session('status') }}" />
    @endif
@endpush

@section('content')
    <x-jstooltip />
    @if ($items->count() > 0)
        <x-jsdatatable />
    @endif

    <h4 class="fw-bold py-3 mb-4">@yield('title')</h4>

    <div class="card px-2">
        <div class="row">
            <div class="col-xl-6 mb-xl-0 mb-3">
                <div class="btn-toolbar demo-inline-spacing" role="toolbar" aria-label="Toolbar with button groups">
                    <div class="btn-group" role="group" aria-label="Third group">
                        <a href="{{ route('admin.karyawan.create') }}" type="button" class="btn btn-outline-secondary"
                            data-bs-toggle="tooltip" data-bs-placement="top" title="Tambah">
                            <i class="fa-solid fa-circle-plus"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <x-karyawan.table :items="$items"></x-karyawan.table>
    </div>
@endsection
