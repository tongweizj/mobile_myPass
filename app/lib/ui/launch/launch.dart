import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mypass/ui/style/style.dart';
import 'package:mypass/ui/widgets/button.dart';

class LaunchPage extends StatefulWidget {
  LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  // logo
  Widget _buildLogo() {
    return Container(
      width: 338.w,
      margin: EdgeInsets.only(top: (40 + 44.0).h), // 顶部系统栏 44px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 157.h,
            width: 338.w,
            margin: EdgeInsets.symmetric(horizontal: 15.h),
            child: Image.asset(
              "assets/images/launch-logo.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 115.h),
            child: Text(
              "小熊帮你保管小钥匙",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.appColorSecond,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                height: 1,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "这下好了，所有的蜂蜜都保管好了！",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: StyleColors.appTextSecond,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildbuttonList() {
    return Container(
      width: 295.w,
      // height: 204,
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          // TODO：注册页面
          // btnFlatButtonWidget(
          //   onPressed: () {
          //     Navigator.pushNamed(
          //       context,
          //       "/home",
          //     );
          //   },
          //   gbColor: appColorFirst,
          //   title: "开始使用",
          // ),
          SizedBox(height: 10),
          longRectangleBtnWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/login",
              );
            },
            gbColor: StyleColors.appColorFirst,
            title: "登录",
            width: 0.8.sw,
            height: 40.h,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: StyleColors.appBgFivth,
        child: Column(
          children: <Widget>[
            _buildLogo(),
            Spacer(),
            _buildbuttonList(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
