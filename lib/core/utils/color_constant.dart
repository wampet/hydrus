import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
 static Color orange4007f = fromHex('#7fff9933');

  static Color indigoA700C1 = fromHex('#c10000ff');

  static Color orange40049 = fromHex('#49ff9933');

  static Color red400 = fromHex('#d9544f');

  static Color gray50 = fromHex('#fafaff');

  static Color green400 = fromHex('#5cb85c');

  static Color black900 = fromHex('#000000');

  static Color black90040 = fromHex('#40000000');

  static Color xenteOrange = fromHex('#FF9F43');

  static Color lightXenteOrange = fromHex('#FFE3C7');

  static Color gray501 = fromHex('#ababab');

  static Color gray400 = fromHex('#c4c4c4');

  static Color gray500 = fromHex('#9ca69c');

  static Color gray401 = fromHex('#bdbdbd');

  static Color labelgrey = fromHex('#4d4a4a');

  static Color gray100B2 = fromHex('#b2f2f2f2');

  static Color orange400 = fromHex('#ff9933');

  static Color orange40019 = fromHex('#19ff9933');

  static Color gray100 = fromHex('#f5f5f5');
  

  static Color black90054 = fromHex('#54000000');

  static Color indigo300 = fromHex('#7082ba');

  static Color bluegray900 = fromHex('#14294a');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color bluegray800 = fromHex('#303d66');

  static Color black90099 = fromHex('#99000000');

  static Color indigoA700 = fromHex('#0000ff');

  static Color bluegray500 = fromHex('#63738c');

  static Color indigoA70099 = fromHex('#990000ff');

  static Color bluegray400 = fromHex('#888888');

  static Color bluegray300 = fromHex('#9ca3b0');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray800C1 = fromHex('#c14d4a4a');

  static Color gray4007f = fromHex('#7fc4c4c4');

   static Color grayfield = fromHex('#64748B');
    static Color darkblue = fromHex('#303E67');
    static Color xenteblue = fromHex('000444');
  
    static Color xentelightblue = fromHex('7081B9');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
