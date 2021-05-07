import 'package:tinybank/components/defaultTinybank_textInput.dart';
import 'package:tinybank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = 'Criando transferência';
const _labelNumeroConta = 'Número da conta';
const _hintNumeroConta = '12345';
const _labelValor = 'Valor';
const _hintValor = '0.00';
const _confirmButtonText = 'Confirmar';

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  
  final _controllerNumeroConta = new TextEditingController();
  final _controllerValor = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
                children: [
                  DefaultTinyBankTextInput(
                    controller: _controllerNumeroConta,
                    label: _labelNumeroConta,
                    hint: _hintNumeroConta,
                  ),
                  DefaultTinyBankTextInput(
                    controller: _controllerValor,
                    label: _labelValor,
                    hint: _hintValor,
                    icon: Icons.monetization_on,
                    // formatter: CurrencyInputFormatter(),
                  ),
                  ElevatedButton(
                    child: Text(_confirmButtonText),
                    onPressed: () {
                      _criarTransferencia(context);
                    },
                  ),
                ],
              ),
            ),
      appBar: AppBar(title: Text(_tituloAppbar),),      
      );
  }


  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerNumeroConta.text);
    final double valor = double.tryParse(_controllerValor.text);

    if (numeroConta == null || valor == null) return;

    final Transferencia transferencia = Transferencia(valor, numeroConta);

    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$transferencia')));
    Navigator.pop(context, transferencia);
  }
}

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}