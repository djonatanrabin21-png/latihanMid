import 'dart:io';

voidtampilanawal() {
  print('\n=============================');
  print('==== PT Retail Sejahtera ====');
  print('==============================');
  print('1. Pilih Toko & Masuk Menu Toko');
  print('2. Keluar');
  stdout.write("pilih menu(1-2) : ");
  String? pilih = stdin.readLineSync();
  if (pilih == 2) {
    print('terimakasih');
  }else{

  }
}

Map<String, List<Map<String, dynamic>>> dataToko = {
  "a": <Map<String, dynamic>>[],
  "b": <Map<String, dynamic>>[],
  "c": <Map<String, dynamic>>[],
  "d": <Map<String, dynamic>>[],
};

bool jalan = true;

void main() {
  while (jalan) {
    voidtampilanawal();
    void menuToko(
      String kode,
      Map<String, List<Map<String, dynamic>>> dataToko,
    ) {
      print("\n======================================");
      print("SELAMAT DATANG DITOKO ${kode.toUpperCase()}");
      print("\n======================================");
      print("Masuk ke Menu Toko ${kode.toUpperCase()}");
    }

    void inputData(
      String kode,
      Map<String, List<Map<String, dynamic>>> dataToko,
    ) {
      print("\n=== Input data Barang (${kode.toUpperCase()})");
      stdout.write("masukkan nama barang : ");
      String nama = (stdin.readLineSync() ?? "").trim();
      if (nama.isEmpty) {
        print("Peringatan : nama tidak boleh kososng");
        return;
      }
      stdout.write("masukkan harga barang : ");
      double? harga = double.tryParse(stdin.readLineSync() ?? "");
      if (harga == null || harga < 0) {
        print("Peringatan : harga tidak boleh kosong");
        return;
      }
      stdout.write("Masukkan Jumlah stock : ");
      int? stock = int.tryParse(stdin.readLineSync() ?? "");
      if (stock == null || stock < 0) {
        print("peringatan : stock tidak boleh kosong");
        return;
      }
      Map<String, dynamic> itemBarang = {
        "nama": nama,
        "harga": harga,
        "stock": stock,
      };
      dataToko[kode]!.add(itemBarang);
      print("sukses : Barang '$nama' berhasil ditambah");
    }

    void lihatData(
      String kode,
      Map<String, List<Map<String, dynamic>>> dataToko,
    ) {
      print("\n===== Daftar barang di toko(${kode.toUpperCase()})===");
      List<Map<String, dynamic>>? daftarBarang = dataToko[kode];

      if (daftarBarang == null || daftarBarang.isEmpty) {
        print("belum ada barang tersedia di toko ini");
        return;
      }
      for (int i = 0; i < daftarBarang.length; i++) {
        var barang = daftarBarang[i];
        print("${i + 1}.Nama :${barang['nama']}");
        print("  Harga :${barang['harga']}");
        print("  Stock :${barang['stock']}");
      }
    }

    void keluarprogram() {
      print('Terimakasi');
    }

    print('\npilih toko & Masuk menu');
    stdout.write('Masukan kode Toko A/B/C/D :');
    String? pilih = stdin.readLineSync()?.trim().toLowerCase() ?? "";

    switch (pilih) {
      case "1":
        print('\n===== Pilih Kode Toko =====');
        print("kode tersedia :[a] Toko A, [b] Toko B, [c] Toko C, [d] Toko D");
        stdout.write("masukkan kode toko (a/b/c/d):");
        pilih = (stdin.readLineSync() ?? "");

        if (dataToko.containsKey(pilih)) {
          menuToko(pilih, dataToko);
        } else {
          print("Kode toko tidak valid");
        }
        break;
      case "2":
        keluarprogram();
        jalan = false;
        break;
    }

    bool menu = true;
    while (menu) {
      print("\n=== menu :===");
      print("1. Input Data(Nama, Harga, Stock)");
      print("2. Lihat Data");
      print("3. Hapus Data");
      print("4. kembali ke menu utama");
      stdout.write("masukkan pilihan menu (1 - 4) : ");
      String? pilihanmenu = stdin.readLineSync();
      switch (pilihanmenu) {
        case "1":
          inputData(pilih, dataToko);
          break;
        case "2":
          lihatData(pilih, dataToko);
          break;
        case "3":
          (pilih, dataToko);
          break;
        case "4":
          menu = false;
          break;
      }
    }
  }
}
