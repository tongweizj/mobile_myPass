import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:flutter/material.dart';

/// 输入框
Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: duSetHeight(50),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: appColorFirst,
      borderRadius: Radii.k4pxRadius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: appColorFirst,
        fontFamily: "SFProText",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(17),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

/// 用户名输入框
Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: duSetHeight(33),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: appColorThird,
      borderRadius: Radii.k4pxRadius,
      // border: Border.all(width: 1, color: appColorFirst)
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: appTextFurth, fontSize: duSetFontSize(16)),
        contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 5),
        border: OutlineInputBorder(),
      ),
      style: TextStyle(
        color: appTextFurth,
        fontFamily: "SFProText",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(16),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

class InputPassword extends StatefulWidget {
  const InputPassword({
    this.fieldKey,
    this.hintText,
    this.isPassword = true,
    this.marginTop = 15,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  final Key fieldKey;
  final String hintText;
  final bool isPassword;
  final double marginTop;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: duSetHeight(33),
      margin: EdgeInsets.only(top: duSetHeight(widget.marginTop)),
      decoration: BoxDecoration(
          color: appColorThird,
          borderRadius: Radii.k4pxRadius,
          border: Border.all(width: 1, color: appColorThird)),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: appTextFurth),
          contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 5),
          border: InputBorder.none,
          // suffixIcon: GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       _obscureText = !_obscureText;
          //     });
          //   },
          //   child: new Icon(_obscureText ? Iconfont.eyeoff : Iconfont.eyeon),
          // ),
        ),
        style: TextStyle(
          color: appTextThird,
          fontFamily: "SFProText",
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(16),
        ),
        maxLines: 1,
        autocorrect: false, // 自动纠正
        // 隐藏输入内容, 密码框
      ),
    );
  }
}
