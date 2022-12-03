import 'package:controle_estoque/database/app_database.dart';
import 'package:controle_estoque/models/product.dart';
import 'package:controle_estoque/pages/product_form.dart';
import 'package:controle_estoque/pages/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        initialData: const [],
        future: findAll(),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // Future ainda não foi executado
              break;
            case ConnectionState.waiting:
              // Future ainda está carregando
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Carregando...',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
                    ),
                  ],
                ),
              );
            // break;
            case ConnectionState.active:
              // Snapshot tem um dado, mais ainda não foi finalizado o Future
              // Exemplo: pedaços de download.....Stream
              break;
            case ConnectionState.done:
              //
              final List? products = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Product product = products![index];
                  return ProductItem(product: product);
                },
                itemCount: products?.length,
              );
            // break;
          }
          return const Text('Erro desconhecido!!');
        }),
      ),
      //
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const ProductForm(),
                ),
              )
              .then(
                (newProduct) => debugPrint(newProduct.toString()),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
