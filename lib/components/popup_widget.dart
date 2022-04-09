import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

getPopup(BuildContext context) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.INFO,
    animType: AnimType.BOTTOMSLIDE,
    title: "Sobre o IMC",
    desc: "Alguma coisa",
    btnCancelOnPress: () => {},
    btnCancelText: "Fechar",
  ).show();
}
