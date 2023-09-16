import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueGray50 = fromHex('#ebeff2');

  static Color blueGray10001 = fromHex('#d5dde0');

  static Color blueGray10002 = fromHex('#d9d9d9');

  static Color gray5003f = fromHex('#3f979797');

  static Color black90090 = fromHex('#90000000');

  static Color red500 = fromHex('#f9442b');

  static Color gray50 = fromHex('#f7f8f9');

  static Color cyan7004c = fromHex('#4c0099b8');

  static Color greenA700 = fromHex('#00d455');

  static Color black900 = fromHex('#000000');

  static Color gray50001 = fromHex('#abacab');

  static Color black90084 = fromHex('#84000000');

  static Color blueGray800 = fromHex('#3e4958');

  static Color blueGray90002 = fromHex('#293050');

  static Color lightBlueA700 = fromHex('#007fff');

  static Color blueGray90001 = fromHex('#222b45');

  static Color cyan70033 = fromHex('#330099b8');

  static Color blueGray900 = fromHex('#0c174b');

  static Color gray600 = fromHex('#808080');

  static Color tealA700 = fromHex('#00bc83');

  static Color blueGray5001 = fromHex('#f1f1f1');

  static Color blueGray100 = fromHex('#ccd6dd');

  static Color gray500 = fromHex('#979797');

  static Color blueGray400 = fromHex('#7b8199');

  static Color blueGray300 = fromHex('#9aa0b8');

  static Color gray90066 = fromHex('#66121619');

  static Color blueGray500 = fromHex('#6a769a');

  static Color blueGray5000c = fromHex('#0c6a769a');

  static Color gray900 = fromHex('#221f1f');

  static Color black9000f = fromHex('#0f000000');

  static Color orange400 = fromHex('#f8972c');

  static Color gray200 = fromHex('#e7e7e7');

  static Color gray300 = fromHex('#d8e2dc');

  static Color blueGray30001 = fromHex('#9aa1b8');

  static Color gray30001 = fromHex('#e6e6e6');

  static Color blueGray9007c = fromHex('#7c0b164b');

  static Color blue50 = fromHex('#d8ebff');

  static Color gray100 = fromHex('#f1f4f7');

  static Color orange40001 = fromHex('#f9972c');

  static Color bluegray400 = fromHex('#888888');

  static Color blueGray9001e = fromHex('#1e16244c');

  static Color gray200Ef = fromHex('#efeeeeee');

  static Color cyan70001 = fromHex('#1589a1');

  static Color blueGray50019 = fromHex('#196a769a');

  static Color gray90051 = fromHex('#51181e30');

  static Color whiteA700 = fromHex('#ffffff');

  static Color cyan700 = fromHex('#0099b8');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
