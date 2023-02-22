import 'dart:io';

String? input;
int? hasil_input;

void main() {
  // Menginputkan nilai dan menyimpannya dalam variabel String input
  stdout.write("Masukkan input : ");
  input = stdin.readLineSync();

  // Mengkonversi variabel String input menjadi variabel Integer hasil input
  hasil_input = int.parse(input!);

  // Menampilkan pada layar tabel perkalian dari 1 sampai dengan nilai input
  print("Tabel Perkalian 1 - $hasil_input");

  // Melakukan perulangan untuk mencetak tabel perkalian
  for (int x = 1; x <= hasil_input!; x++) {
    for (int y = 1; y <= hasil_input!; y++) {
      stdout.write(" ");
      stdout.write(x * y);
      stdout.write("\t ");
    }
    print(" ");
  }
}
