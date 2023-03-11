import 'dart:io';

void main() {
  // Memanggil method tambah muatan
  Mobil().tambahMuatan();
}

// Class Hewan
class Hewan {
  String nama;
  int berat;
  Hewan({
    required this.nama,
    required this.berat,
  });
}

// Class Mobil
class Mobil {
  // Memberikan nilai kapasitas yaitu 100 dan total berat awal 0
  int kapasitas = 100, totalBerat = 0;
  // Membuat list muatan dari class hewan
  List<Hewan> muatan = [];

  // Method total muatan
  void totalMuatan() {
    if (totalBerat <= 100) {
      if (totalBerat == kapasitas) {
        for (var item in muatan) {
          print("Nama Hewan : ${item.nama}");
        }
      } else {
        tambahMuatan();
      }
    } else {
      print("Kelebihan Muatan");
    }
  }

  // Method tambah muatan
  void tambahMuatan() {
    print("Masukkan Nama Hewan");
    String? nama = stdin.readLineSync();
    print("Masukkan Berat Hewan");
    String? berat = stdin.readLineSync();
    muatan.add(
      Hewan(
        nama: nama!,
        berat: int.parse(
          berat!,
        ),
      ),
    );
    totalBerat += int.parse(berat);
    totalMuatan();
  }
}
