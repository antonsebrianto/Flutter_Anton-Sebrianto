import 'dart:io';

String? panjang;
String? lebar;
int hasil_panjang = 0;
int hasil_lebar = 0;

void main() {
  // Menginputkan nilai panjang dari sebuah persegi panjang
  stdout.write("Masukkan panjang dari persegi panjang : ");
  panjang = stdin.readLineSync();
  hasil_panjang = int.parse(panjang!);

  // Menginputkan nilai lebar dari sebuah persegi panjang
  stdout.write("Masukkan lebar dari persegi panjang : ");
  lebar = stdin.readLineSync();
  hasil_lebar = int.parse(lebar!);

  // Memanggil fungsi keliling dan fungsi luas
  Keliling();
  Luas();
}

void Keliling() {
  // Rumus keliling persegi panjang
  int keliling_persegi_panjang = 2 * (hasil_panjang + hasil_lebar);
  print("Keliling persegi panjang adalah : $keliling_persegi_panjang cm");
}

void Luas() {
  // Rumus luas persegi panjang
  int luas_persegi_panjang = hasil_panjang * hasil_lebar;
  // Menampilkan luas persegi panjang ke layar
  print("Luas persegi panjang adalah : $luas_persegi_panjang cm");
}
