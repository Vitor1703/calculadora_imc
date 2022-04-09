import 'package:calculadora_imc/imc/calcula_imc_widget.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      home: const CalculaImcWidget(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.purple,
        backgroundColor: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          centerTitle: false,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.purple,
          secondary: Colors.purple,
        ),
      ),
    );
  }
}
