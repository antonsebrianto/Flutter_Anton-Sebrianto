import 'dart:io';

void main() {
  // Memanggil class Kelipatan Persekutuan Terkecil
  KelipatanPersekutuanTerkecil kelipatanPersekutuanTerkecil =
      KelipatanPersekutuanTerkecil();
  stdout.write("Kelipatan Persekutuan Terkecil dari 3 dan 5 : ");
  // Memanggil method hasil dari kelipatan persekutuan terkecil
  kelipatanPersekutuanTerkecil.Hasil();
  // Memanggil class Faktor Persekutuan Terbesar
  FaktorPersekutuanTerbesar faktorPersekutuanTerbesar =
      FaktorPersekutuanTerbesar();
  stdout.write("Faktor Persekutuan Terbesar dari 12 dan 24 : ");
  // Memanggil method hasil dari faktor persekutuan terbesar
  faktorPersekutuanTerbesar.Hasil();
}

// Abstract Class Matematika
abstract class Matematika {
  void Hasil();
}

// Class Kelipatan Persekutuan Terkecil implements Matematika
class KelipatanPersekutuanTerkecil implements Matematika {
  int x = 3;
  int y = 5;

  // Method hasil
  void Hasil() {
    if ((x > y) && (x != 0) && (y != 0)) {
      for (int i = x; i < x * y; i++) {
        if ((i % x == 0) && (i % y == 0)) {
          print(i);
        }
      }
    } else if ((y > x) && (x != 0) && (y != 0)) {
      for (int i = y; i < x * y; i++) {
        if ((i & x == 0) && (i & y == 0)) {
          print(i);
        }
      }
    } else {
      print("");
    }
  }
}

// Class Faktor Persekutuan Terbesar implements Matematika
class FaktorPersekutuanTerbesar implements Matematika {
  int x = 12;
  int y = 24;

  // Method Hasil
  void Hasil() {
    while (x != y) {
      if (x > y) {
        x = x - y;
        print(x);
      } else {
        y = y - x;
        print(y);
      }
    }
  }
}
