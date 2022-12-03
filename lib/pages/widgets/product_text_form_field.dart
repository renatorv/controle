import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class ProductTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final int? qtdLinhas;
  final TextInputType teclado;
  final int qtdPalavras;
  final String msgErro;
  const ProductTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    this.qtdLinhas = 0,
    required this.teclado,
    required this.qtdPalavras,
    required this.msgErro,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences ,
      validator: Validatorless.required(msgErro),
      maxLength: qtdPalavras,
      maxLines: qtdLinhas != 0 ? qtdLinhas : null,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        errorStyle: const TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
            color: Colors.grey[400]!,
          ),
        ),
      ),
      style: const TextStyle(fontSize: 24),
      keyboardType: teclado,
      controller: controller,
      cursorColor: Theme.of(context).primaryColor,
    );
  }
}
