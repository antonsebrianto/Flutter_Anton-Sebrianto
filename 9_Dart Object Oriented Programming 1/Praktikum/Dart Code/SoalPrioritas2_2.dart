void main() {
  // Memanggil class student dan menginputkan nama dan kelas
  Student student = Student("Anton", "Basic");
  // Menambahkan course pertama
  student.tambahCourse(Course('Fundamental Object Oriented', 'OOP'));
  // Menampilkan course setelah menambahkan course pertama
  student.lihatCourse();
  // Menambahkan course kedua
  student.tambahCourse(Course('Deep Dive', 'OOP'));
  // Menampilkan course setelah menambahkan course kedua
  student.lihatCourse();
  // Menghapus course dengan judul Fundamental Object Oriented (Course pertama)
  student.hapusCourse(Course('Fundamental Object Oriented', 'OOP'));
  // Menampilkan course setelah menghapus course pertama
  student.lihatCourse();
}

// Class Course
class Course {
  String judul;
  String deskripsi;

  Course(this.judul, this.deskripsi);
}

// Class Student
class Student {
  String nama;
  String kelas;
  // Membuat list dari class course
  List<Course> daftarCourse = [];

  Student(this.nama, this.kelas);

  // Method menambahkan course
  void tambahCourse(Course course) {
    daftarCourse.add(course);
  }

  // Method menghapus course
  void hapusCourse(Course course) {
    for (var i = 0; i < daftarCourse.length; i++) {
      if (daftarCourse[i].judul == course.judul) {
        daftarCourse.removeAt(i);
      }
    }
  }

  // Method melihat course
  void lihatCourse() {
    if (daftarCourse.isEmpty) {
      print('Belum ada course yang ditambahkan');
    } else {
      print('Daftar course:');
      for (Course course in daftarCourse) {
        print('- ${course.judul}: ${course.deskripsi}');
      }
    }
  }
}
