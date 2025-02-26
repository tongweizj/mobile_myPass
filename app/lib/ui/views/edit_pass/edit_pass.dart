import 'package:mypass/core/api/apis.dart';
import 'package:mypass/core/entitys/entitys.dart';
import 'package:mypass/core/utils/utils.dart';
import 'package:mypass/core/values/values.dart';
import 'package:mypass/global.dart';
import 'package:mypass/ui/shared/shared.dart';
import 'package:mypass/ui/widgets/widgets.dart';
import 'package:mypass/ui/views/edit_pass/components/pass_form.dart';
// import 'package:mypass/ui/views/edit_pass/components/text_edit.dart';
// import 'package:mypass/ui/views/edit_pass/components/webiste_form.dart';
import 'package:flutter/material.dart';

class EditPassPage extends StatefulWidget {
  EditPassPage({Key key}) : super(key: key);

  @override
  _EditPassPageState createState() => _EditPassPageState();
}

class _EditPassPageState extends State<EditPassPage> {
  //email的控制器
  final TextEditingController _emailController = TextEditingController();
  //username的控制器
  final TextEditingController _usernameController = TextEditingController();

  //密码的控制器
  final TextEditingController _passController = TextEditingController();
  //网站的控制器
  final TextEditingController _websiteController = TextEditingController();
  //网站字母logo的控制器
  final TextEditingController _webLetterLogo = TextEditingController();
  // 顶部导航
  Widget _buildAppBar(AppPasswordModel passItem) {
    return fouthAppBar(
        context: context,
        title: '编辑',
        leading: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          textColor: appColorThird,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '取消',
            style: TextStyle(fontSize: duSetFontSize(14)),
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () async {
              Map<String, dynamic> params = {
                "pass_email": _emailController.text,
                "pass_username": _usernameController.text,
                "pass_website": _websiteController.text,
                "pass_password": _passController.text,
                "web_letter_logo": _webLetterLogo.text,
                "pass_id": passItem.id,
                "usr": Global.profile.user.id
              };

              await GqlPasswordAPI.updateUserPassword(
                  context: context, params: params);
              Navigator.pushNamed(
                context,
                "/home",
              );
            },
            textColor: appColorThird,
            height: 0,
            padding: EdgeInsets.zero,
            child: Text(
              '完成',
              style: TextStyle(fontSize: duSetFontSize(14)),
            ),
          ),
        ]);
  }

  Widget _buildBlockConnect(AppPasswordModel passItem) {
    return Container(
      color: appBgPrimary,
      height: duSetHeight(40),
      width: duSetWidth(375),
      padding: EdgeInsets.only(
          left: duSetWidth(20),
          right: duSetWidth(0),
          bottom: duSetHeight(0),
          top: duSetHeight(0)),
      child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        MaterialButton(
          onPressed: () async {
            Map<String, dynamic> params = {
              "pass_id": passItem.id,
            };

            await GqlPasswordAPI.deleteUserPassword(
                context: context, params: params);
            Navigator.pushNamed(
              context,
              "/home",
            );
          },
          // color: Colors.blue,
          textColor: appTextThird,
          minWidth: 30,
          height: 0,
          padding: EdgeInsets.zero,
          child: Text(
            '删除',
            // textAlign: TextAlign.left,
            style: TextStyle(fontSize: duSetFontSize(16)),
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppPasswordModel passItem = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: _buildAppBar(passItem),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /// 模块1： 密码信息
            SizedBox(
              height: duSetHeight(2),
            ),

            buildPassForm(context,
                passItem: passItem,
                emailController: _emailController,
                usernameController: _usernameController,
                passController: _passController,
                websiteController: _websiteController,
                webLetterLogoController: _webLetterLogo),
            Divider(),
            SizedBox(height: duSetHeight(40)),
            Divider(),
            _buildBlockConnect(passItem),

            /// 模块2：网站信息
            // BuildWebsiteForm(),

            /// 模块3：类别
            // _buildBlockHeader('联系人'),
            // _buildBlockConnect(),
            // Divider(
            //   height: duSetHeight(3),
            // ),
            // Spacer(),
          ],
        ),
      ),
    );
  }
}
