import 'dart:io';

void main() {
  // Memanggil function luas lingkaran dengan parameter jari-jari 10cm
  Luas(10);
}

// Function luas lingkaran
void Luas(int jari_jari) {
  double pi = 3.14;
  double luas_lingkaran = pi * jari_jari * jari_jari;
  print("Luas lingkaran adalah : $luas_lingkaran cm");
}
