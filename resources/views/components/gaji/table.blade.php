<div>
    <x-babeng.table-one>
        <x-slot name="thead">
            <th class="babeng-min-row text-center">No</th>
            <th class="text-center">Aksi</th>
            <th>Tanggal Transaksi</th>
            <th>Nama Karyawan</th>
            <th>Nominal</th>
        </x-slot>
        <x-slot name="tbody">
            @forelse ($items as $item)
                <tr>
                    <td class=" text-center">{{ $loop->index + 1 }}</td>
                    <td class="babeng-min-row">
                        @if (Auth()->user()->tipeuser == 'admin')
                            <x-btndelete link="{{ route('admin.gaji.destroy', $item->id) }}"></x-btndelete>
                        @endif
                    </td>
                    <td>{{ $item->created_at_ind }}</td>
                    <td>{{ $item->karyawan->nama }}</td>
                    <td class="text-center">{{ $item->nominal_ind }}</td>
                </tr>
            @empty
            @endforelse
        </x-slot>
    </x-babeng.table-one>
</div>

@push('before-script')
    <script>
        let tbodyContent = ``;
        var buktipembayaran = null;
        var kodetransaksi = null;

        function btnModalDetailTransaksi(url = null, id = null, status = null, urlUpdate = null, totalbayar = null,
            totaltagihan = 0, ongkir = 0) {

            // console.log(url,id);
            //fetch
            $.ajax({
                url: url,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    tbodyContent = ``;
                    buktipembayaran = data.bukti;
                    kodetransaksi = data.kodetrans;
                    // console.log(kodetransaksi);
                    let divModalBuktiContent = `Bukti Pembayaran Belum di upload!`;
                    if (buktipembayaran) {
                        divModalBuktiContent =
                            `
    <h5 class="modal-title" id="formModalLabel">Bukti Pembayaran</h5>
    <img id="frame" src="${buktipembayaran}" class="w-px-400 h-auto "  style="display: block;max-width: 100%;height: 200px;object-fit: cover" />`;
                    }

                    let divModalDetailContent =
                        `<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>`;
                    if (status == 'pending') {
                        divModalDetailContent = `<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
@if (Auth()->user()->tipeuser == 'admin')
    <form action="${urlUpdate}" method="post" class="d-inline">
    @csrf
    <input type="hidden" name="status" value="cancel">
    <button class="btn  btn-danger "
        onclick="return  confirm('Anda yakin mengkonfirmasi data ini? Y/N')"  data-bs-toggle="tooltip" data-bs-placement="top" title="Konfirmasi data!"> Batalkan Pembelian!</button>

</form>

<form action="${urlUpdate}" method="post" class="d-inline">
    @csrf
    <input type="hidden" name="status" value="success">
    <button class="btn  btn-success "
        onclick="return  confirm('Anda yakin mengkonfirmasi data ini? Y/N')"  data-bs-toggle="tooltip" data-bs-placement="top" title="Konfirmasi data!"> Konfirmasi Pembelian!</button>

</form>
@endif
@php
    $kodetrans = 0;
    if (!empty($item)) {
        $kodetrans = $item->kodetrans;
    }
@endphp

@if (Auth()->user()->tipeuser == 'pelanggan')
<a href="{{ url('/pelanggan/transaksi/upoadbukti/') }}/${kodetransaksi}" class="btn  btn-info "
        onclick="return  confirm('Anda yakin mengkonfirmasi data ini? Y/N')"  data-bs-toggle="tooltip" data-bs-placement="top" title="Konfirmasi data!"> Upload bukti pembayaran!</a>
@endif

            `;
                    }

                    if (status == 'success' || status == 'cancel') {
                        divModalDetailContent = `  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            @if (Auth()->user()->tipeuser == 'admin')
            <form action="${urlUpdate}" method="post" class="d-inline">
    @csrf
    <input type="hidden" name="status" value="pending">
    <button class="btn  btn-dark "
        onclick="return  confirm('Anda yakin mengkonfirmasi data ini? Y/N')"  data-bs-toggle="tooltip" data-bs-placement="top" title="Pending data!"> Pending Pembelian!</button>

</form>
@endif`;
                        // divModalDetailContent=`<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    // <button type="button" class="btn btn-info" data-bs-dismiss="modal">Tunggu Konfirmasi </button>
                    // `;
                    }
                    $('#divModalDetail').html(divModalDetailContent);
                    let modalTransaksiDetail = `<div>
            <H5>KodeTrans : ${kodetransaksi}</H5>
        <br>
        <h5>Total Tagihan : ${totaltagihan}</h5>
        <br>
        <h5>Ongkir : ${ongkir}</h5>
        <br>
        <h5>Total bayar : ${totalbayar}</h5>
            </div>
        `;
                    $('#divModalTransaksiDetail').html(modalTransaksiDetail);
                    $('#divModalBukti').html(divModalBuktiContent);
                    // console.log(buktipembayaran);
                    $.each(data.data, function(index, value) {
                        tbodyContent += `
                        <tr>
                            <td class="text-center">${index+1}</td>
                            <td>${value.produk.nama}</td>
                            <td>${value.harga_jual}</td>
                            <td class="text-center">${value.jml}</td>
                            <td class="text-center">${value.harga_jual*value.jml}</td>
                        </tr>
                    `;
                    });
                    $('#trbody').html(tbodyContent);
                }
            });


            // console.log(buktipembayaran);
        }
    </script>
@endpush
