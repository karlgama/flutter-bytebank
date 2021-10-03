import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';

const _rotuloValor = 'Valor';
const _dicaValor = '0.00';
const _dicaNumeroConta = '0000';
const _rotuloNumeroConta = 'Número da conta';
const _textoBotao = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
            controlador: _controladorCampoNumeroConta,
            dica: _dicaNumeroConta,
            rotulo: _rotuloNumeroConta,
          ),
          Editor(
              controlador: _controladorCampoValor,
              dica: _dicaValor,
              rotulo: _rotuloValor,
              icone: Icons.monetization_on),
          ElevatedButton(
            child: Text(_textoBotao),
            onPressed: () => _criarTransferencia(context),
          ),
        ]),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('criar transferencia');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
