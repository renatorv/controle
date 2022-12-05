import 'package:controle_estoque/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'estoque.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('''CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          description TEXT,
          quantity INTEGER)''');
    },
    version: 1,
  );
}

Future<int> save(Product product) async {
  final Database db = await getDataBase();
  final Map<String, dynamic> productMap = {};

  productMap['name'] = product.name;
  productMap['description'] = product.description;
  productMap['quantity'] = product.quantity;

  return db.insert('products', productMap);
}

Future<List<Product>> findAll() async {
  final Database db = await getDataBase();

  final List<Map<String, dynamic>> result = await db.query('products');

  final List<Product> products = [];

  for (Map<String, dynamic> row in result) {
    final Product product = Product(
      row['id'],
      row['name'],
      row['description'],
      row['quantity'],
    );

    products.add(product);
  }

  return products;
}
