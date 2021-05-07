import 'package:flutter/material.dart';

import 'screens/lista_transferencia.dart';

void main() => runApp(TinybankApp());

class TinybankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green.shade900,
        accentColor: Colors.blueAccent.shade700,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent.shade700,
          textTheme: ButtonTextTheme.accent
        ),
      ),
      home: ListaTransferencias(),
      debugShowCheckedModeBanner: false,
    );
  }
}