import 'package:controle_estoque/database/dao/product_dao.dart';
import 'package:flutter/material.dart';

// import '../database/app_database.dart';
import '../models/product.dart';
import 'widgets/product_text_form_field.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final ProductDao _productDao = ProductDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Produto'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                ProductTextFormField(
                  msgErro: 'Nome Produto requerido',
                  label: 'Produto',
                  controller: _nomeController,
                  teclado: TextInputType.text,
                  qtdPalavras: 30,
                ),
                const SizedBox(height: 10),
                ProductTextFormField(
                  msgErro: 'Descrição requerida',
                  label: 'Descrição',
                  controller: _descricaoController,
                  qtdLinhas: 2,
                  teclado: TextInputType.text,
                  qtdPalavras: 60,
                ),
                const SizedBox(height: 10),
                ProductTextFormField(
                  msgErro: 'Quantidade requerida',
                  label: 'Quantidade',
                  controller: _quantidadeController,
                  teclado: const TextInputType.numberWithOptions(),
                  qtdPalavras: 10,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.maxFinite,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final String name = _nomeController.text;
                        final String description = _descricaoController.text;
                        final int? quantity = int.tryParse(_quantidadeController.text);

                        final Product newProduct = Product(0, name, description, quantity!);
                        _productDao.save(newProduct).then((id) => Navigator.pop(context));
                      }
                    },
                    child: const Text(
                      'Adicionar',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
