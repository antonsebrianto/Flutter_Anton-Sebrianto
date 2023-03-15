# Resume Introduction Flutter Widget

3 Poin yang dipelajari dari materi Introduction Flutter Widget

- Stateless Widget merupakan widget statis yang biasanya digunakan hanya untuk tampilan saja yang dimana di dalamnya tidak terjadi perubahan data atau state, sedangkan pada Stateful Widget merupakan widget dinamis yang digunakan pada tampilan yg dapat melakukan perubahan data atau state.
- MaterialApp digunakan untuk membangun sebuah aplikasi yang menggunakan desain material, sedangkan Scaffold digunakan untuk membangun sebuah halaman.
- Pada widget Scaffold dibagi menjadi 3 kelompok, yaitu :
    1. Standalone widget
        Standalone widget merupakan sebuah widget yang tidak memiliki widget lain di dalamnya dan memiliki fungsi tertentu. Contoh dari Standalone widget yaitu :
        - AppBar
        - ImageAsset
        - Icon
        - Text
        - TextStyle
    2. Single child widget
        Single child widget merupakan sebuah widget yang hanya memiliki 1 widget lain di dalamnya dan memiliki property "child" untuk memasukkan widget lain kedalam single child widget. Contoh Single child widget yaitu :
        - Center
        - Container
        - Expanded
        - CircleAvatar
        - RaisedButton
    3. Multiple children widget
        Multiple children widget merupakan widget yang dapat memiliki lebih dari 1 widget di dalamnya dan memiliki property "children" untuk memasukkan seperti kolom atau baris untuk layout atau konten pada widget tersebut. Contoh Multiple children widget yaitu :
        - Row
        - Column
        - GridView
        - Stack