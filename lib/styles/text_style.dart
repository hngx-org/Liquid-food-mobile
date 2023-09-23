import 'package:flutter/material.dart';

class AppTextStyle{

  static const TextStyle  appBar = TextStyle(
    color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20,
  );

  static const TextStyle  activeFormLabel = TextStyle(
      color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 15
  );

  static const TextStyle  inactiveFormLabel = TextStyle(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15,
  );

  static const TextStyle  formHint= TextStyle(
      color: Color.fromRGBO(166, 166, 166, 1), fontWeight: FontWeight.w400, fontSize: 14,
  );
}