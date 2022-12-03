import 'package:controle_estoque/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'estoque.db');

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
    },
  );
}

Future<int> save(Product product) {
  return createDataBase().then((db) {
    final Map<String, dynamic> productMap = {};

    // productMap['id'] = product.id; Não precisa pois o sqlite fica responsável por incrementar o id
    productMap['name'] = product.name;
    productMap['description'] = product.description;
    productMap['quantity'] = product.quantity;

    return db.insert('products', productMap);
  });
}

Future<List<Product>> findAll() {
  return createDataBase().then((db) {
    return db.query('products').then((maps) {
      final List<Product> products = [];
      for (Map<String, dynamic> map in maps) {
        final Product product = Product(
          map['id'],
          map['name'],
          map['description'],
          map['quantity'],
        );

        products.add(product);
      }
      return products;
    });
  });
}
