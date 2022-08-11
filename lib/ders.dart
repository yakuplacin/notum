import 'package:flutter/material.dart';

class Ders {
  String? dersName = "";
  int? dersCredit = 0;
  String? dersLetter = "";
  TextEditingController? dersCreditController = TextEditingController();
  TextEditingController? dersLetterController = TextEditingController();

  Ders({
    this.dersName,
    this.dersCredit,
    this.dersLetter,
    this.dersCreditController,
    this.dersLetterController,
  });
}
