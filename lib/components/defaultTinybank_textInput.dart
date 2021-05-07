import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTinyBankTextInput extends StatelessWidget{
  
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final List<TextInputFormatter> formatterList = [
    //FilteringTextInputFormatter.digitsOnly,
    FilteringTextInputFormatter.singleLineFormatter
  ];

  DefaultTinyBankTextInput({
    @required this.controller,
    this.label,
    this.hint,
    this.icon,
    TextInputFormatter formatter,
  }) {
    if (formatter != null){
      formatterList.add(formatter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(        
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24.0
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        inputFormatters: formatterList,
      ),
    );
  }
}