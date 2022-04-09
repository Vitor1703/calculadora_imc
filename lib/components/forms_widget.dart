import 'package:flutter/material.dart';

getFormPadrao({String? label, String? hint, required TextEditingController controller, String? erroValidacao, bool? autofocus}) {
  return TextFormField(
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5),
      ),
      labelText: label ?? "Label",
      hintText: hint ?? "Digite algo",
    ),
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return erroValidacao ?? "Valor inválido";
      }
      return null;
    },
    autofocus: autofocus ?? false,
  );
}

getFormPeso({required TextEditingController controller}) {
  return getFormPadrao(
    controller: controller,
    label: "Peso",
    hint: "Digite o peso",
    autofocus: true,
    erroValidacao: "Peso inválido",
  );
}

getFormAltura({required TextEditingController controller}) {
  return getFormPadrao(
    controller: controller,
    label: "Altura",
    hint: "Digite a altura (cm)",
    erroValidacao: "Altura inválida",
  );
}
