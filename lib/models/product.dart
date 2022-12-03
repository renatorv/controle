class Product {
  final int id;
  final String name;
  final String description;
  final int quantity;

  Product(
    this.id,
    this.name,
    this.description,
    this.quantity,
  );

  @override
  String toString() => 'Product(id: $id, name: $name, description: $description, quantity: $quantity)';
}
