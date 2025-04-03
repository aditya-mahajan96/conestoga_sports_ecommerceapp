
import 'package:flutter/material.dart';

import '../utils/dimens.dart';


class CustomTextFieldNew extends StatefulWidget {
  var maxlines;
  var margin;

  //Can be changed according to user.. made dynamic so that user can made their own text field

  final Color visibleColor, visibleoffColor;
  final String counterText;

  final String hintText, labelText, emptyPassword;
  final TextStyle hintStyle, labelStyle;
  final InputBorder border, enabledborder, focusedborder;
  final EdgeInsetsGeometry contentpadding;
  final spacebetween;
  TextEditingController textEditingController;
  var borderColor;
  var textColor;var themeColor;
  var borderRadius;
  var maxLength;
  var keyboardShow;
  var prefixImage;
  bool obscureText;
  bool showPasswordIcon;
  var textInputAction;
  var focusNode;
  var fontSize;
  bool? isSentance;
  bool? prefixTypeImage;
  bool readOnly;
  FormFieldValidator<String>? onValidate;
  final GestureTapCallback? onsuffixTap;
  final GestureTapCallback? onWidgetClicked;
  final ValueChanged? onChangedTap;

  CustomTextFieldNew({
    this.maxlines,
    this.keyboardShow,
    this.onValidate,
    this.focusNode,
    this.showPasswordIcon = false,
    this.prefixTypeImage = false,
    this.isSentance,
    required this.margin,
    required this.maxLength,
    required this.textEditingController,
    this.visibleColor = Colors.grey,
    this.visibleoffColor = Colors.grey,
    this.counterText = "",
    this.hintText = "Enter value",
    this.labelText = "",
    this.emptyPassword = "Value is empty",
    this.hintStyle = const TextStyle(color: Color(0xFF7C82A1)),
    this.themeColor= Colors.white,
    this.labelStyle = const TextStyle(color: Colors.black),

    this.border = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    ),
    this.enabledborder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    this.focusedborder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    this.contentpadding =
    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
    this.spacebetween = 5.0,
    required this.obscureText,
    required this.borderColor,
    required this.borderRadius,
    this.textColor=Colors.black,
    this.textInputAction,
    required this.fontSize,
    this.onsuffixTap,
    required this.readOnly,
    this.onChangedTap,this.onWidgetClicked,
  });

  InputBorder aa = new OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.circular(10.0));

  @override
  _CustomTextFieldNewState createState() => _CustomTextFieldNewState();
}

class _CustomTextFieldNewState extends State<CustomTextFieldNew> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: widget.margin.toDouble()),
      child: Column(children: [
        TextFormField(
          onTap: widget.onWidgetClicked,
          textAlign: TextAlign.start,
          obscuringCharacter: widget.obscureText == true ? '*' : '?',
          maxLines: widget.maxlines.toInt(),
          obscureText: widget.obscureText,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          readOnly: widget.readOnly,
          validator: widget.onValidate,
          controller: widget.textEditingController,
          keyboardType: widget.keyboardShow,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChangedTap,
          textCapitalization: widget.isSentance == true
              ? TextCapitalization.sentences
              : TextCapitalization.none,
          decoration: InputDecoration(
              counterText: "",
              filled: true, //<-- SEE HERE
              fillColor: widget.themeColor,
              hintStyle: widget.hintStyle,
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: widget.borderColor, width: Dimens.one),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              contentPadding: widget.contentpadding,
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: widget.borderColor, width: Dimens.one),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              border: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: widget.borderColor, width: Dimens.one),
                  borderRadius: BorderRadius.circular(widget.borderRadius))),
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: Dimens.fourteen,
              background: null,
              color: widget.textColor),
        ),
      ]),
    );
  }
}
