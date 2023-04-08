# Resume Flutter State Management (BLoC)

3 Poin yang dipelajari dari materi Flutter State Management (BLoC)

- Flutter state management BLoC merupakan state management flutter yang dapat memisahkan tampilan (UI) dari bisnis logic pada aplikasi flutter, sehingga dapat memudahkan pengembangan dan memperbaiki performa aplikasi. Flutter state management BLoC sangat efektif, powerful dan testable tetapi susah untuk diterapkan karena butuh pembelajaran ekstra untuk dapat menggunakan BLoC yang ideal.
- BLoC terdiri dari 3 bagian utama, yaitu :
    1. Streams dan Sinks
        Streams merupakan aliran data yang dikirimkan dari source (sumber data) ke sebuah objek, sedangkan Sinks merupakan objek yang digunakan untuk memudahkan atau memasukkan data ke Streams.
    2. Event
        Event merupakan inputan dari pengguna (user) atau sistem yang memicu perubahan pada aplikasi yang dapat berupa tombol yang ditekan, request dari API, dan perubahan data dari database.
    3. State
        State merupakan objek yang merepresentasikan keadaan terakhir dari aplikasi. Setiap perubahan pada aplikasi akan menghasilkan state yang baru, dan state ini akan digunakan untuk mengupdate tampilan pada aplikasi.
- Untuk menggunakan BLoC kita harus menginstall package 'flutter_bloc', menambahkan BlocProvider sebagai widget yang menyediakan BLoC ke childrennya, menambahkan BlocBuilder sebagai widget yang menangani pembuatan widget sebagai respons terhadap state baru.