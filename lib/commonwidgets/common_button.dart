import 'package:etlaafinalproject/commonwidgets/commonTextWidget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  late var text = "";
  var fontWeight;
  double fontSize;
  var fontColor;
  var color;
  bool haveShadow= false;
  var textAlignment;
  var height;
  var widthValue;
  var wordSpacing;
  var textDecoration;
  final EdgeInsetsGeometry marginValues;
  final EdgeInsetsGeometry paddingValues;
  final int? maxLines;
  final TextOverflow? overflow;
  var fontFamily;
  var decorationthickness;
  final GestureTapCallback? onWidgetClicked;

  CommonButton({required this.text,required this.haveShadow, required this.fontWeight, required this.fontSize, required this.fontColor, required this.color, this.textAlignment = TextAlign.center, this.height, this.widthValue = double.infinity, this.textDecoration, this.wordSpacing, this.maxLines, this.overflow,  this.marginValues = const EdgeInsets.all(8), this.paddingValues = const EdgeInsets.all(1), this.decorationthickness, required this.onWidgetClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onWidgetClicked,
      child: Container(
        padding: paddingValues,
        margin: marginValues,
        width: widthValue,
        height: height,
        decoration:haveShadow== true? BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ):BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(30))
        ),
        child: CommonTextWidget(
          text: text,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontColor: fontColor,
          textAlignment: this.textAlignment,
        ),
      ),
    );
  }
}
