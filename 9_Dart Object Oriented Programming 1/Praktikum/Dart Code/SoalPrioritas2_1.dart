import 'dart:io';

void main() {
  // Memanggil class calculator
  Calculator calculator = Calculator();
  /* Memanggil semua method yang ada dalam class calculator,
  lalu mengisi nilai a yaitu 10 dan nilai b yaitu 10,
  dan menampilkan semua method
  */
  print("---------------------------");
  stdout.write("Penjumlahan Dua Bilangan : ");
  print(calculator.tambah(10, 10));
  print("---------------------------");
  stdout.write("Pengurangan Dua Bilangan : ");
  print(calculator.kurang(10, 10));
  print("---------------------------");
  stdout.write("Perkalian Dua Bilangan : ");
  print(calculator.kali(10, 10));
  print("---------------------------");
  stdout.write("Pembagian Dua Bilangan : ");
  print(calculator.bagi(10, 10));
  print("---------------------------");
}

// Class Calculator
class Calculator {
  // Method penjumlahan dua bilangan
  double tambah(double a, double b) {
    return a + b;
  }

  // Method pengurangan dua bilangan
  double kurang(double a, double b) {
    return a - b;
  }

  // Method perkalian dua bilangan
  double kali(double a, double b) {
    return a * b;
  }

  // Method pembagian dua bilangan
  double? bagi(double a, double b) {
    if (b == 0) {
      print('Tidak diperbolehkan pembagian dengan nol');
      return null;
    }
    return a / b;
  }
}
