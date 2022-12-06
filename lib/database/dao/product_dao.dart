import 'package:controle_estoque/database/app_database.dart';
import 'package:controle_estoque/models/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductDao {
  static const String tableSqlCreate = '''
            CREATE TABLE $_tableName(
            $_id INTEGER PRIMARY KEY,
            $_name TEXT,
            $_description TEXT,
            $_quantity INTEGER)
          ''';

  // Constantes privadas
  static const String _tableName = 'products';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _description = 'description';
  static const String _quantity = 'quantity';

  Future<int> save(Product product) async {
    final Database db = await getDataBase();

    Map<String, dynamic> productMap = _toMap(product);

    return db.insert(_tableName, productMap);
  }

  Map<String, dynamic> _toMap(Product product) {
    final Map<String, dynamic> productMap = {};
    productMap[_name] = product.name;
    productMap[_description] = product.description;
    productMap[_quantity] = product.quantity;
    return productMap;
  }

  Future<List<Product>> findAll() async {
    final Database db = await getDataBase();

    final List<Map<String, dynamic>> result = await db.query(_tableName);

    List<Product> products = _toList(result);

    return products;
  }

  List<Product> _toList(List<Map<String, dynamic>> result) {
    final List<Product> products = [];

    for (Map<String, dynamic> row in result) {
      final Product product = Product(
        row[_id],
        row[_name],
        row[_description],
        row[_quantity],
      );

      products.add(product);
    }
    return products;
  }
}
