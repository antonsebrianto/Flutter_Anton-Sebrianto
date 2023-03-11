void main() {
  // Memanggil class list buku
  ListBuku listbuku = ListBuku();
  // Menambahkan buku pertama
  listbuku.tambahBuku(Buku(1, "Golda", "Italian", 3000, "Drink"));
  // Menambahkan buku kedua
  listbuku.tambahBuku(Buku(2, "Tricks", "Asian", 8000, "Food"));
  // Melihat list buku yang tersedia
  listbuku.lihatBuku();
  // Menghapus buku pertama
  listbuku.hapusBuku(Buku(1, "Golda", "Italian", 3000, "Drink"));
  // Melihat list buku yang tersedia setelah menghapus buku pertama
  listbuku.lihatBuku();
}

// Class Buku
class Buku {
  int id;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
}

// Class List Buku
class ListBuku {
  // Membuat list buku dari class buku
  List<Buku> listBuku = [];

  // Method menambahkan buku
  void tambahBuku(Buku buku) {
    listBuku.add(buku);
  }

  // Method melihat buku
  void lihatBuku() {
    if (listBuku.isEmpty) {
      print("Belum ada data buku yang tersedia");
    } else {
      print("Daftar buku : ");
      for (Buku buku in listBuku) {
        print(
            "- ${buku.judul}, ${buku.penerbit}, ${buku.harga}, ${buku.kategori}");
      }
    }
  }

  // Method menghapus buku
  void hapusBuku(Buku buku) {
    for (var i = 0; i < listBuku.length; i++) {
      if (listBuku[i].judul == buku.judul) {
        listBuku.removeAt(i);
      }
    }
  }
}
