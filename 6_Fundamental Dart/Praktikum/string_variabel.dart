import 'dart:io';

String? pertama;
String? kedua;
String? ketiga;

void main() {
  // Menginputkan variabel pertama
  stdout.write("Masukkan variabel pertama : ");
  pertama = stdin.readLineSync();

  // Menginputkan variabel kedua
  stdout.write("Masukkan variabel kedua : ");
  kedua = stdin.readLineSync();

  // Menginputkan variabel ketiga
  stdout.write("Masukkan variabel ketiga : ");
  ketiga = stdin.readLineSync();

  // Menyambungkan 3 variabel dan menampilkan pada layar
  print("$pertama " + "$kedua " + "$ketiga ");
}
