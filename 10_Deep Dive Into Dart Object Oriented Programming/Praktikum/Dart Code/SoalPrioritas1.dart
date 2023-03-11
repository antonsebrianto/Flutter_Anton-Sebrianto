void main() {
  // Memanggil class kubus dan menginputkan nilai sisi = 10
  Kubus kubus = Kubus(sisi: 10);
  // Memanggil method volume dalam class kubus
  kubus.volume();
  // Memanggil class balok dan menginputkan masing masing nilai
  Balok balok = Balok();
  balok.panjang = 10;
  balok.lebar = 10;
  balok.tinggi = 8;
  // Memanggil method volume dalam class balok
  balok.volume();
}

// Abstract Class BangunRuang
abstract class BangunRuang {
  int? panjang;
  int? lebar;
  int? tinggi;
  void volume();
}

// Class Kubus Extends BangunRuang
class Kubus extends BangunRuang {
  int? sisi;

  Kubus({required this.sisi});

  @override
  // Method volume Bangun Ruang Kubus
  void volume() {
    int result = sisi! * sisi! * sisi!;
    print("Volume dari bangun ruang kubus : $result cm");
  }
}

// Class Balok Extends
class Balok extends BangunRuang {
  @override
  // Method volume Bangun Ruang Balok
  void volume() {
    int result = panjang! * lebar! * tinggi!;
    print("Volume dari bangun ruang balok : $result cm");
  }
}
