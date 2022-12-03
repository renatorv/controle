import 'package:flutter/material.dart';

import 'pages/dashboard.dart';

void main() {
  runApp(const MyApp());
  // save(Product(1, 'Vermifogo', 'Vermifogo Cachorro', 300)).then((id) {
  //   findAll().then((products) => debugPrint(products.toString()));
  // });
  // findAll().then((products) => debugPrint(products.toString()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Controle de Estoque',
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.blueAccent[700],
        ),
      ),
      home: const Dashboard(),
    );
  }
}
