import 'dart:io';

int faktorial = 1;
int? bilangan_bulat;
void main() {
  // Menginputkan bilangan bulat dan menyimpannya kedalam variabel Integer bilangan bulat
  stdout.write("Masukkan bilangan bulat : ");
  bilangan_bulat = int.parse(stdin.readLineSync()!);

  // Jika bilangan yang di inputkan bukan bilangan bulat maka akan menampilkan bahwa bilangan yang di inputkan bukan merupakan bilangan bulat
  if (bilangan_bulat! < 0) {
    print("$bilangan_bulat bukan merupakan bilangan bulat");
  }
  // Jika bilangan yang di inputkan merupakan bilangan bulat maka akan dilakukan faktorial dengan rumus faktorial dalam bahasa pemrograman seperti berikut
  else {
    for (int i = 1; i <= bilangan_bulat!; i++) {
      faktorial *= i;
    }
    print("Hasil faktorial dari " +
        bilangan_bulat.toString() +
        " = " +
        faktorial.toString());
  }
}
