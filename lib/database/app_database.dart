import 'package:controle_estoque/database/dao/product_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'estoque.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ProductDao.tableSqlCreate);
    },
    version: 1,
  );
}
