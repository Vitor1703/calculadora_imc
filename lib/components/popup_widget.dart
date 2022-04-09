import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

getPopup(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    title: "Sobre o IMC",
    desc: "O IMC (ou índice de massa corporal) é um cálculo simples que permite avaliar se a pessoa está dentro do peso que é considerado ideal para a sua altura. \n\n\n REFERÊNCIA: https://www.tuasaude.com/imc/",
    btnCancelOnPress: () => {},
    btnCancelText: "Fechar",
  ).show();
}
