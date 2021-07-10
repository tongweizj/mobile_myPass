import 'package:mypass/core/view_models/pass_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 输入模块
///
/// 包含：模块头： 标题，如姓名； 输入框： 文本输入，email输入
/// 传入：
///     context：
///     controller 输入框的controller
///     title, 模块头的标题
///     value,
///     hintText, 输入框的默认文案
///     isEmail，控值键盘是否email键盘
///     isPassword 控值输入文字是否改为 *
Widget buildPasswordTextField(BuildContext context,
    {required TextEditingController controller,
    String title = '',
    String? value = '',
    String hintText = '',
    bool isEmail = false,
    bool isPassword = false}) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(0, 10.h, 0, 0),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12.sp,
                color: StyleColors.appTextFurth,
                height: 1.h,
              ),
            )),
        isPassword == false
            ? inputTextEdit(
                controller: controller,
                hintText: hintText,
                obscureText: isPassword)
            : inputPasswordEdit(context,
                controller: controller,
                hintText: hintText,
                obscureText: isPassword),
        Divider(),
      ]);
}

/// 输入框
Widget inputTextEdit(
    {required TextEditingController controller,
    String hintText = '',
    bool isEmail = false,
    bool obscureText = false}) {
  return Container(
    height: 30.h,
    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    // color: appColorFirst,
    child: TextField(
      controller: controller,
      keyboardType:
          isEmail == false ? TextInputType.text : TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: StyleColors.appColorSecond),
        contentPadding: EdgeInsets.fromLTRB(0, 2, 0, 5),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: StyleColors.appColorSecond,
        fontWeight: FontWeight.w400,
        fontSize: 14.sp,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: obscureText, // 隐藏输入内容, 密码框
    ),
  );
}

/// 密码输入框
Widget inputPasswordEdit(BuildContext context,
    {required TextEditingController controller,
    String hintText = '',
    bool isEmail = false,
    bool obscureText = false}) {
  return Row(
    children: <Widget>[
      Expanded(
          child: Container(
        height: 30.h,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        // color: appColorFirst,
        child: TextField(
          controller: controller,
          keyboardType: isEmail == false
              ? TextInputType.text
              : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: StyleColors.appColorSecond),
            contentPadding: EdgeInsets.fromLTRB(0, 2, 0, 5),
            border: InputBorder.none,
          ),
          style: TextStyle(
            color: StyleColors.appColorSecond,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
          maxLines: 1,
          autocorrect: false, // 自动纠正
          obscureText:
              !context.watch<PassDetailModel>().isShowPass, // 隐藏输入内容, 密码框
        ),
      )),
      GestureDetector(
        onTap: () {
          context.read<PassDetailModel>().changePassword();
        },
        child: new Icon(context.watch<PassDetailModel>().isShowPass
            ? Icons.visibility
            : Icons.visibility_off),
      ),
      SizedBox(
        width: 20.w,
      ),
    ],
  );
}
