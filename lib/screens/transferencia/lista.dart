import 'dart:ui';

import 'package:tinybank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _titleAppBar = 'Transferências';
const _messageNaoExisteTransferencia = 'Adicione uma transferência.';
const _textoBotaoIncluirTransferencia = 'Incluir nova transferência.';

class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar),),
      body: widget._transferencias.length > 0
        ? ListView.builder(
            itemCount: widget._transferencias.length,
            itemBuilder: (context, index) => _itemBuilder(context, index),
          )
        : Center(
            child: Text(_messageNaoExisteTransferencia,
            style: TextStyle(fontSize: 24),),
          ),
      floatingActionButton: Tooltip(
        message: _textoBotaoIncluirTransferencia,
        child: FloatingActionButton(        
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTransferencia()))
            .then((transferenciaCriada) => _atualizar(transferenciaCriada));
          }
        ),),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = widget._transferencias[index];

    return Dismissible(
      key: Key(item.toString()),
      child: ItemTransferencia(item),
      onDismissed: (direction) {
        setState(() {
          widget._transferencias.removeAt(index);
        });
      },
      background: Container(color: Colors.red,),
    );
  }

  void _atualizar(Transferencia transferenciaCriada) {
    if (transferenciaCriada == null) return;
    setState(() {
      widget._transferencias.add(transferenciaCriada);
    });
  }
}

class ListaTransferencias extends StatefulWidget {
  
  final List<Transferencia> _transferencias = List<Transferencia>.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ItemTransferencia extends StatelessWidget{

  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.numeroConta.toString()),
      subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}