<div>
    {{-- {{dd($items)}} --}}
    {{-- {{'test'}} --}}
    <x-babeng.table-one>
        <x-slot name="thead">
            <th class="babeng-min-row text-center">No</th>
            <th class="text-center">Aksi</th>
            <th>Nama</th>
            <th class="babeng-min-row text-center">JK</th>
            <th class="babeng-min-row text-center">Telp</th>
            <th class="babeng-min-row text-center">Alamat</th>
            <th class="babeng-min-row text-center">No Rekening</th>
            <th class="babeng-min-row text-center">Bank</th>
        </x-slot>
        <x-slot name="tbody">
            @forelse ($items as $item)
                <tr>
                    <td class=" text-center">{{ $loop->index + 1 }}</td>
                    <td class="babeng-min-row">
                        <x-btnedit link="{{ route('admin.karyawan.edit', $item->id) }}"></x-btnedit>
                        <x-btndelete link="{{ route('admin.karyawan.destroy', $item->id) }}"></x-btndelete>
                    </td>
                    <td>{{ $item->nama }}</td>
                    <td>{{ $item->jk }}</td>
                    <td>{{ $item->telp }}</td>
                    <td>{{ $item->alamat }}</td>
                    <td>{{ $item->no_rekening }}</td>
                    <td>{{ $item->bank }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="8" class="text-danger text-center">
                        Data Kosong
                    </td>
                </tr>
            @endforelse
        </x-slot>
    </x-babeng.table-one>
</div>
