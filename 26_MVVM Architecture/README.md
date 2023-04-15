# Resume MVVM Architecture

3 Poin yang dipelajari dari materi MVVM Architecture

- Model-View-ViewModel (MVVM) merupakan pola arsitektur yang digunakan untuk membangun antarmuka pengguna dan memisahkan aplikasi menjadi tiga komponen yang saling terhubung yaitu :
    1. Model yang dimana mewakili data dan logika bisnis aplikasi dan bertanggung jawab untuk mengambil, menyimpan, dan memproses data.
    2. View yang dimana bertanggung jawab menampilkan data dan antarmuka pengguna.
    3. ViewModel yang dimana bertindak sebagai perantara antara Model dan View. ViewModel mengekspos data dan logika bisnis Model ke View dengan cara yang mudah digunakan dan dimanipulasi dan juga menyediakan pengikatan data yang diperlukan untuk menjaga UI selalu sinkron dengan data.
- MVVM architecture memiliki beberapa keuntungan, yaitu Reusability yang dimana jika ada beberapa tampilan yang memerlukan alur logic yang sama maka dapat menggunakan ViewModel yang sama, Maintainability yang dimana perawatan dari aplikasi menjadi mudah karena pekerjaan terkait tampilan tidak tertumpuk bersama logic, Testability yang dimana pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga dapat meningkatkan produktifitas pada pengujian
- Untuk mendaftarkan ViewModel dapat menggunakan MultiProvider agar dapat menggunakan banyak ViewModel dan dimana menggunakan MaterialApp sebagai child utama.