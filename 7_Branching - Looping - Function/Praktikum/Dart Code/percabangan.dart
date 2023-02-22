import 'dart:io';

String? nilai;
int? hasil_nilai;
String? grade;

void main() {
  // Menginputkan nilai dan menyimpannya dalam variabel String nilai
  stdout.write("Masukkan nilai : ");
  nilai = stdin.readLineSync();

  // Mengubah String nilai menjadi Integer hasil nilai
  hasil_nilai = int.parse(nilai!);

  // Apabila nilai > 70 maka akan menampilkan nilai A
  if (hasil_nilai! > 70) {
    print("Nilai A");
  }
  // Apabila nilai > 40 maka akan menampilkan nilai B
  else if (hasil_nilai! > 40) {
    print("Nilai B");
  }
  // Apabila nilai > 0 maka akan menampilkan nilai C
  else if (hasil_nilai! > 0) {
    print("Nilai C");
  }
  // Selain itu akan menampilkan teks kosong
  else {
    print("");
  }
}
