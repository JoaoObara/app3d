import 'package:flutter/material.dart';

//Customização do Validatorless
//Comparar senha
class Validators {
  Validators._();

  static FormFieldValidator compare(
      TextEditingController? valuePSW, String message) {
    return (value) {
      final valueCompare = valuePSW?.text ?? '';
      //Se o valor for nulo OU o valor for != null e diferente do valor comparado...
      if (value == null || (value != null && value != valueCompare)) {
        return message; //Mensagem de erro na validação
      }
      return null;
    };
  }
}
