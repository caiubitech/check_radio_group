import 'package:flutter/material.dart';

class GroupStyle {
  Color activeColor;
  TextStyle titleStyle;
  TextAlign titleAlign;
  TextStyle subTitleStyle;
  TextAlign subTitleAlign;
  ListTileControlAffinity checkPosition;

  _titleStyle({double fontSize}) =>
      TextStyle(height: 1.3, fontSize: fontSize, fontWeight: FontWeight.w500);

  GroupStyle(
      {this.activeColor,
      this.titleStyle,
      this.titleAlign = TextAlign.left,
      this.subTitleStyle,
      this.subTitleAlign = TextAlign.left,
      this.checkPosition = ListTileControlAffinity.leading}) {
    if (titleStyle == null) {
      titleStyle = _titleStyle(fontSize: 16);
    }
    if (subTitleStyle == null) {
      subTitleStyle = _titleStyle(fontSize: 12);
    }
  }
}
