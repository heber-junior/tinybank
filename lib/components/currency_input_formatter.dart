import 'package:flutter/services.dart';

//todo: Não implementado.
class CurrencyInputFormatter extends TextInputFormatter {  

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String _value = newValue.text;

    switch (_value.length) {
      case 1:
        _value = '0.0$_value';
        break;
      case 2:
        _value = '0.$_value';
        break;
      default:
        String _decimal = _value.substring(_value.length - 2);
        String _integer = _value.substring(0, _value.length - 2);
        _value = '$_integer.$_decimal';
    }

    TextSelection s = newValue.selection.copyWith(baseOffset: _value.length, extentOffset: _value.length);
    TextEditingValue t = newValue.copyWith(text: _value, selection: s);

    return t;
  }
}