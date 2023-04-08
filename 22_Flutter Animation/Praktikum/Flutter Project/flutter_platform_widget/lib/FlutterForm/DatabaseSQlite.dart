import 'package:sqflite/sqflite.dart' as sql;

class DatabaseSQlite {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('''CREATE TABLE contacts (
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      nama TEXT,
      no_telp VARCHAR,
      tanggal VARCHAR,
      color VARCHAR,
      file VARCHAR
    )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('contactsnew.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  // tambah
  static Future<int> tambahContact(String nama, String no_telp, String date,
      String color, String file) async {
    final db = await DatabaseSQlite.db();
    final data = {
      'nama': nama,
      'no_telp': no_telp,
      'tanggal': date,
      'color': color,
      'file': file
    };
    return await db.insert('contacts', data);
  }

  // ambil data
  static Future<List<Map<String, dynamic>>> getContacts() async {
    final db = await DatabaseSQlite.db();
    return db.query('contacts');
  }

  //ubah data
  static Future<int> ubahContacts(int id, String nama, String no_telp,
      String date, String color, String file) async {
    final db = await DatabaseSQlite.db();
    final data = {
      'nama': nama,
      'no_telp': no_telp,
      'tanggal': date,
      'color': color,
      'file': file
    };
    return await db.update('contacts', data, where: "id = $id");
  }

  //hapus data
  static Future<int> hapusContacts(int id) async {
    final db = await DatabaseSQlite.db();
    // final data = {'id': id, 'nama': nama, 'no_telp': no_telp};
    return await db.delete('contacts', where: "id = $id");
  }
}
