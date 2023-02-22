import 'dart:io';

String? bilangan;
int? hasil_bilangan;
void main() {
  // Menginputkan angka yang akan di cari faktor bilangannya dan menyimpannya ke dalam variabel String bilangan
  stdout.write("Masukkan angka yang akan di cari faktor bilangannya : ");
  bilangan = stdin.readLineSync();

  // Mengubah angka yang di inputkan yang semula berbentuk variabel String menjadi Integer dan disimpan dalam variabel hasil_bilangan
  hasil_bilangan = int.parse(bilangan!);

  // Rumus mencari faktor bilangan
  for (int i = 1; i < hasil_bilangan!; i++) {
    if (hasil_bilangan! % i == 0) {
      // Menampilkan hasil faktor bilangan ke layar
      print(i);
    }
  }
}
