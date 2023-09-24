<div>
    <form id="setting-form" method="POST"
        action="{{ $item ? route('admin.gaji.update', $item->id) : route('admin.gaji.store') }}">
        @php
            //declare var
            $karyawan_id = '';
            $nominal = null;
        @endphp
        @if ($item)
            @method('put')
            @php
                $karyawan_id = $item->karyawan_id;
                $nominal = $item->nominal;
            @endphp
        @endif
        @csrf
        <div class="row py-2 px-2">
            <div class="form-group row align-items-center py-2">
                <label for="karyawan_id" class="form-control-label col-sm-3 text-md-right" id="karyawan_id_label">
                    Karyawan
                </label>
                <div class="col-sm-6 col-md-9">
                    <select class="js-example-basic-single form-control @error('karyawan_id') is-invalid @enderror"
                        id="karyawan_id" name="karyawan_id" required>
                        <option value="">Pilih Karyawan</option>
                        @foreach ($karyawans as $karyawan)
                            <option {{ old('karyawan_id') == $karyawan->id ? 'selected' : '' }}
                                value="{{ $karyawan->id }}">
                                {{ $karyawan->nama }}
                            </option>
                        @endforeach
                    </select>
                    @error('jk')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror

                </div>
            </div>

            <div class="form-group row align-items-center py-2">
                <label for="nominal" class="form-control-label col-sm-3 text-md-right" id="nominal_label">
                    Nominal
                </label>
                <div class="col-sm-6 col-md-9">
                    <input type="number" class="form-control  @error('nominal') is-invalid @enderror" name="nominal"
                        required value="{{ old('nominal') ?? $nominal }}" id="nominal" placeholder="Nominal">
                    @error('nominal')
                        <div class="invalid-feedback"> {{ $message }}</div>
                    @enderror
                </div>
            </div>

            <div class="card-footer d-flex justify-content-between flex-row-reverse" id="divBtnSubmit">
                <button type="submit" class="btn btn-dark" id="save-btn" data-bs-toggle="tooltip"
                    data-bs-placement="top">Simpan</button>
            </div>
        </div>
    </form>

</div>
