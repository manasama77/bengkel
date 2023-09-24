<div>
    <form id="setting-form" method="POST"
        action="{{ $item ? route('admin.karyawan.update', $item->id) : route('admin.karyawan.store') }}">
        @php
            //declare var
            $nama = '';
            $jk = null;
            $telp = null;
            $alamat = null;
            $no_rekening = '';
            $bank = '';
        @endphp
        @if ($item)
            @method('put')
            @php
                $nama = $item->nama;
                $jk = $item->jk;
                $telp = $item->telp;
                $alamat = $item->alamat;
                $no_rekening = $item->no_rekening;
                $bank = $item->bank;
            @endphp
        @endif
        @csrf
        <div class="row py-2 px-2">
            <div class="form-group row align-items-center py-2">
                <label for="nama" class="form-control-label col-sm-3 text-md-right" id="label_nama">
                    Nama
                </label>
                <div class="col-sm-6 col-md-9">
                    <input type="text" class="form-control  @error('nama') is-invalid @enderror" name="nama"
                        required value="{{ old('nama') ? old('nama') : $nama }}" id="nama">

                    @error('nama')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror

                </div>
            </div>

            <div class="form-group row align-items-center py-2">
                <label for="jk" class="form-control-label col-sm-3 text-md-right">Jenis Kelamin </label>
                <div class="col-sm-6 col-md-9">
                    <select class="js-example-basic-single form-control @error('jk') is-invalid @enderror"
                        id="jk" name="jk" required>
                        <option value="">Pilih Jenis Kelamin</option>
                        <option {{ (old('jk') == 'l' ? 'selected' : $jk == 'l') ? 'selected' : '' }} value="l">
                            Laki-laki</option>
                        <option {{ (old('jk') == 'p' ? 'selected' : $jk == 'p') ? 'selected' : '' }} value="p">
                            Perempuan</option>
                    </select>
                    @error('jk')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror

                </div>
            </div>

            <div class="form-group row align-items-center py-2">
                <label for="telp" class="form-control-label col-sm-3 text-md-right" id="label_telp">Telp</label>
                <div class="col-sm-6 col-md-9">
                    <input type="tel" class="form-control  @error('telp') is-invalid @enderror" name="telp"
                        required value="{{ old('telp') ? old('telp') : $telp }}" id="inputPassword">
                    @error('telp')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror
                </div>
            </div>

            <div class="form-group row align-items-center py-2">
                <label for="alamat" class="form-control-label col-sm-3 text-md-right" id="label_alamat">Alamat</label>
                <div class="col-sm-6 col-md-9">
                    <input type="text" class="form-control  @error('alamat') is-invalid @enderror" name="alamat"
                        required value="{{ old('alamat') ? old('alamat') : $alamat }}" id="inputPassword">
                    @error('alamat')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror
                </div>
            </div>

            <div class="form-group row align-items-center py-2">
                <label for="no_rekening" class="form-control-label col-sm-3 text-md-right" id="label_no_rekening">No
                    Rekening</label>
                <div class="col-sm-6 col-md-9">
                    <input type="number" class="form-control  @error('no_rekening') is-invalid @enderror"
                        name="no_rekening" required
                        value="{{ old('no_rekening') ? old('no_rekening') : $no_rekening }}" id="inputPassword">
                    @error('no_rekening')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror
                </div>
            </div>


            <div class="form-group row align-items-center py-2">
                <label for="bank" class="form-control-label col-sm-3 text-md-right" id="label_bank">Bank</label>
                <div class="col-sm-6 col-md-9">
                    <input type="text" class="form-control  @error('bank') is-invalid @enderror" name="bank"
                        required value="{{ old('bank') ? old('bank') : $bank }}" id="inputPassword">
                    @error('bank')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror
                </div>
            </div>

            {{-- <div class="card-footer d-flex justify-content-between flex-row-reverse" id="divBtnSubmit">
                <span class="btn btn-dark" id="save-btn" data-bs-toggle="tooltip" data-bs-placement="top">Simpan</span>
            </div> --}}

            <div class="card-footer d-flex justify-content-between flex-row-reverse" id="divBtnSubmit">
                <button type="submit" class="btn btn-dark" id="save-btn" data-bs-toggle="tooltip"
                    data-bs-placement="top">Simpan</button>
            </div>
        </div>
    </form>

</div>
