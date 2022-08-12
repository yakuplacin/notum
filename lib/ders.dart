import 'package:flutter/material.dart';

class Ders {
  String? dersName = "";
  int? dersCredit = 0;
  String? dersLetter = "";
  double? dersGrade = 0.0;
  TextEditingController? dersCreditController = TextEditingController();
  TextEditingController? dersLetterController = TextEditingController();

  Ders({
    this.dersName,
    this.dersCredit,
    this.dersLetter,
    this.dersGrade,
    this.dersCreditController,
    this.dersLetterController,
  });
}
