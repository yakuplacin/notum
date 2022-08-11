import 'package:flutter/material.dart';

class Ders {
  String? dersName = "";
  int? dersCredit = 0;
  String? dersLetter = "";
  double? dersGrade = 0.0;
  double? takdirDersGrade = 0.0;
  TextEditingController? dersCreditController = TextEditingController();
  TextEditingController? dersLetterController = TextEditingController();
  TextEditingController? TakdirDersGradeController = TextEditingController();

  Ders(
      {this.dersName,
      this.dersCredit,
      this.dersLetter,
      this.dersGrade,
      this.takdirDersGrade,
      this.dersCreditController,
      this.dersLetterController,
      this.TakdirDersGradeController});
}
