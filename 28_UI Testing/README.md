# Resume UI Testings

3 Poin yang dipelajari dari materi UI Testings

- UI Testing merupakan suatu pengujian yang dilakukan pada UI (Tampilan) suatu aplikasi dengan tujuan untuk memastikan aplikasi dapat menerima interaksi dan memberikan respon kepada pengguna. UI Testing pada flutter disebut juga dengan widget testing yang dimana pengujian dilakukan pada widgets dengan menuliskan script yang dapat dijalankan secara otomatis. UI Testing memiliki beberapa keuntungan, yaitu :
    1. Memastikan seluruh widget memberi tampilan yang sesuai.
    2. Memastikan seluruh interaksi dapat diterima dengan baik.
    3. Menjadi ketentuan yang harus diikuti saat diperlukan perubahan pada widget.
- Penulisan Script Testing dilakukan pada folder test dan setiap nama dari file test harus menggunakan format nama file yang diikuti _test.dart. Dan pada setiap file test memiliki fungsi main() yang didalamnya dapat dituliskan script testing yang dimana skenario pengujian disebut test case. Test case diawali dengan testWidgets dan diberi judul. Untuk menjalankan testing menggunakan perintah 'flutter test' yang akan menjalankan seluruh file test yang dibuat.
- Output Build Flutter merupakan file atau berkas yang dimana merupakan hasil keluaran dari project flutter yang digunakan untuk merilis aplikasi ke Google Play Store ataupun AppStore. Format file keluaran untuk android berupa APK sedangkan format file keluaran untuk iOS berupa IPA.