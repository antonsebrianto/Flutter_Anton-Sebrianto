import 'dart:io';

double pi = 3.14;
String? jari_jari;
int hasil_jari_jari = 0;

void main() {
  // Menginputkan nilai jari-jari dari sebuah lingkaran
  stdout.write("Masukkan jari-jari dari lingkaran : ");
  jari_jari = stdin.readLineSync();
  hasil_jari_jari = int.parse(jari_jari!);

  // Memanggil fungsi keliling dan fungsi luas
  Keliling();
  Luas();
}

void Keliling() {
  // Rumus keliling persegi panjang
  double keliling_lingkaran = 2 * (pi + hasil_jari_jari);
  // Menampilkan keliling persegi panjang ke layar
  print("Keliling lingkaran adalah : $keliling_lingkaran cm");
}

void Luas() {
  // Rumus luas persegi panjang
  double luas_lingkaran = pi * hasil_jari_jari * hasil_jari_jari;
  // Menampilkan luas persegi panjang ke layar
  print("Luas lingkaran adalah : $luas_lingkaran cm");
}
