
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColors{

  MyColors._();

  //app color

  static Color appbarTitle = Colors.white;

  static Color gradient1 = Color(0xff3224AE);
  static Color gradient2 = Color(0xffC069D5);

  static LinearGradient appBarGradient = LinearGradient(
      colors: [
        gradient1,
        gradient2
      ],
    stops: [
      0.5,1.0
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient screenGradient = LinearGradient(
    colors: [
      gradient1,
      gradient2
    ],
    /*stops: [
      0.5,1.0
    ],*/
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient boxGradient = LinearGradient(
    colors: [
      gradient1,
      gradient2
    ],
    /*stops: [
      0.5,1.0
    ],*/
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}