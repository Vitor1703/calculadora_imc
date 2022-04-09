import 'package:calculadora_imc/components/forms_widget.dart';
import 'package:calculadora_imc/components/genero_widget.dart';
import 'package:calculadora_imc/components/popup_widget.dart';
import 'package:flutter/material.dart';

class CalculaImcWidget extends StatefulWidget {
  const CalculaImcWidget({Key? key}) : super(key: key);

  @override
  State<CalculaImcWidget> createState() => _CalculaImcWidgetState();
}

class _CalculaImcWidgetState extends State<CalculaImcWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  late Widget _alerta;
  late Color _corAlerta;

  @override
  void initState() {
    _resetarValores();

    super.initState();
  }

  void _resetarValores() {
    _pesoController.text = "";
    _alturaController.text = "";

    setState(() {
      _alerta = const Center(child: Text("Preencha os campos!!"));
      _corAlerta = Colors.white;
      _formKey = GlobalKey<FormState>();
    });
  }

  _alertaWidget({required String imc, required String alerta}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("IMC de - $imc", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white)),
        Text(alerta, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
      ],
    );
  }

  _calculaImc() {
    setState(() {
      double _peso = double.parse(_pesoController.text);
      double _altura = double.parse(_alturaController.text) / 100;
      double _imc = _peso / (_altura * _altura);

      if (_imc < 18.5) {
        _alerta = _alertaWidget(alerta: "Está abaixo do peso!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = Colors.yellow;
      } else if (_imc > 18.5 && _imc < 24.9) {
        _alerta = _alertaWidget(alerta: "Está no peso normal!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = Colors.green;
      } else if (_imc >= 25.0 && _imc < 29.9) {
        _alerta = _alertaWidget(alerta: "Está com sobrepeso!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = Colors.orange;
      } else if (_imc > 30 && _imc < 34.9) {
        _alerta = _alertaWidget(alerta: "Obesidade grau 1!!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = Colors.redAccent;
      } else if (_imc > 35.0 && _imc < 39.9) {
        _alerta = _alertaWidget(alerta: "Obesidade grau 2!!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = Colors.red;
      } else if (_imc > 40) {
        _alerta = _alertaWidget(alerta: "Obesidade no grau 3!!", imc: _imc.toStringAsPrecision(2));
        _corAlerta = const Color.fromRGBO(173, 0, 0, 1.0);
      }
    });
  }

  _body() {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        const SizedBox(height: 50),
        Center(
          child: RichText(
            text: const TextSpan(
              text: 'I',
              style: TextStyle(color: Colors.purple, fontSize: 60, fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: 'MC',
                  style: TextStyle(color: Colors.black, fontSize: 60, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: genero(),
        ),
        const SizedBox(height: 20),
        getFormPeso(controller: _pesoController),
        const SizedBox(height: 15),
        getFormAltura(controller: _alturaController),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () => {
            if (_formKey.currentState!.validate()) {_calculaImc()}
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(120, 50),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          child: Text("Calcular".toUpperCase()),
        ),
        const SizedBox(height: 20),
        Container(
          height: 240,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _corAlerta,
            border: Border.all(color: Colors.black),
          ),
          child: _alerta,
        ),
      ],
    );
  }

  _form() {
    return Form(
      key: _formKey,
      child: Center(
        child: _body(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora".toUpperCase()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => getPopup(context),
          icon: const Icon(Icons.info),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () => _resetarValores(),
          ),
        ],
      ),
      body: _form(),
    );
  }
}
