import 'dart:io';

double pi = 3.14;
String? jari_jari;
String? tinggi;
int hasil_jari_jari = 0;
int hasil_tinggi = 0;

void main() {
  // Menginputkan nilai jari-jari dari sebuah tabung
  stdout.write("Masukkan jari-jari dari tabung : ");
  jari_jari = stdin.readLineSync();
  hasil_jari_jari = int.parse(jari_jari!);

  // Menginputkan nilai tinggi dari sebuah tabung
  stdout.write("Masukkan tinggi dari tabung : ");
  tinggi = stdin.readLineSync();
  hasil_tinggi = int.parse(tinggi!);

  // Memanggil fungsi Volume
  Volume();
}

void Volume() {
  // Rumus volume tabung
  double volume_tabung = pi * hasil_jari_jari * hasil_jari_jari * hasil_tinggi;
  print("Volume tabung adalah : $volume_tabung cm");
}
