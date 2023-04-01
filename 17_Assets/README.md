# Resume Assets

3 Poin yang dipelajari dari materi Assets

- Assets merupakan file statis seperti image, icon, font dan file konfigurasi yang di bundled dan di deployed bersamaan dengan aplikasi sesuai dengan kebutuhan dari aplikasi kita agar aplikasi kita dapat berfungsi dengan baik dan sesuai dengan keinginan.
- Assets dapat dibagi menjadi dua jenis, yaitu : 
    1. Assets Bundle
        Assets Bundle merupakan file yang diambil oleh aplikasi dari direktori yang sama dengan file aplikasi yang sedang dijalankan yang disimpan di dalam folder "assets" dalam direktori aplikasi.
    2. Assets Network
        Assets Network merupakan file yang diambil oleh aplikasi yang disimpan di server dan dapat diakses melalui jaringan internet.
- Assets yang dibutuhkan aplikasi di identifikasikan pada Pubspec.yaml yang terletak pada root project. Setelah assets-assets yang dibutuhkan aplikasi di masukkan pada Pubspec.yaml, untuk mengunakannya harus terlebih dahulu menjalankan "flutter pub get" agar assets-assets terinstall di aplikasi.