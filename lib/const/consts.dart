import 'package:flutter/material.dart';

class Consts {
  bool value;
  Consts({this.value = false});

  static List<String> assets = [
    'assets/audio/Lise.mp4',
    'assets/audio/Hanne.mp4',
    'assets/audio/Muslinger.mp4',
  ];

  static List<String> lessons = [
    'Lektie 1',
    'Lektie 2',
    'Lektie 3',
  ];
  static List<String> questions = [
    '1. Hvornår stiller Lise sin cykel?',
    '1. Hvor gammel er Hanne? ',
    '1. Hvor kan man finde perler ? ',
  ];
  static List<String> questions2 = [
    '2. Hvor er Lise på vej hen? ',
    '2. Hvordan ser Hannes lejlighed ud? ',
    '2. Hvem fandt en perle? ',
  ];
  static List<String> questions3 = [
    '3. Hvem har stjålet Lises cykel? ',
    '3. Hvorfor er hun glad for at bo alene? ',
    '3. Hvor fandt han den?',
  ];

  static List answers = [];
}

class AppStyle {
  static TextStyle textStyle = TextStyle(
    color: Colors.amber[200],
    fontSize: 25,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
  );
}
