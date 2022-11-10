// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqlite_api.dart';

// class DBhelper {
//   static Future<Database> database() async {
//     final dbPath = await getDatabasesPath();
//     final sqlDb = await openDatabase(
//         join(
//           dbPath,
//           'places.db',
//         ), onCreate: (db, version) {
//       return db.execute(
//           'CREATE TABLE user_places(id TEXT PRIMRY KEY,title TEXT, image TEXT, loc_lat REAL, loc_lng REAl , address TEXT)');
//     }, version: 1);
//     dynamic dosntrtrn(){}
//     print(dosntrtrn())
//   }

//   static Future<void> insert(String table, Map<String, Object> data) async {
//     final db = await DBhelper.database();
//     db.insert(
//       table,
//       data,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     final db = await DBhelper.database();
//     return db.query(table);
//   }
// }
