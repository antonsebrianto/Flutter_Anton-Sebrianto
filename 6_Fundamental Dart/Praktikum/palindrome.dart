import 'dart:io';

String? asli;
String? kebalikan;
void main() {
  // Menginputkan kata yang akan di cari polindrome atau tidak
  stdout.write("Masukkan kata : ");
  asli = stdin.readLineSync();

  // Membalikkan kata yang sudah di input
  kebalikan = asli!.split("").reversed.join("");

  // Jika kata yang di input sama dengan kata yang di balik maka disebut polindrome
  if (asli == kebalikan) {
    print("Kata asli : " "$asli");
    print("Dibalik : " "$kebalikan");
    print("Kata ini merupakan kata palindrome ");
  }
  // Jika kata yang di input tidak sama dengan kata yang di balik maka bukan disebut polindrome
  else {
    print("Kata asli : " "$asli");
    print("Dibalik : " "$kebalikan");
    print("Kata ini bukan merupakan kata palindrome");
  }
}
