import 'dart:io';

int? bilangan_bulat;

void main() {
  // Menginputkan bilangan dan menyimpannya dalam variabel Integer bilangan bulat
  stdout.write("Masukkan bilangan bulat : ");
  bilangan_bulat = int.parse(stdin.readLineSync()!);

  int get_bilangan(int bilangan, int i) {
    if (i == 1) {
      return 1;
    } else if (bilangan % i == 0) {
      return 1 + get_bilangan(bilangan, --i);
    } else {
      return 0 + get_bilangan(bilangan, --i);
    }
  }

  bool cek(int bilangan) {
    if (bilangan > 1) {
      return (get_bilangan(bilangan, bilangan) == 2);
    } else
      return false;
  }

  // Apabila bilangan yang di inputkan merupakan bilangan prima maka akan menampilkan bilangan prima
  if (cek(bilangan_bulat!)) {
    print("$bilangan_bulat merupakan bilangan prima");
  }
  // Apabila bilangan yang di inputkan bukan merupakan bilangan prima maka akan menampilkan bukan bilangan prima
  else {
    print("$bilangan_bulat bukan merupakan bilangan prima");
  }
}
