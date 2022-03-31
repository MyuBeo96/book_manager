import 'package:book_manager/shared/widget/widgets.dart';
import 'package:book_manager/shared/util.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController emailController,
      accountController,
      phoneController,
      passwordController,
      confirmPasswordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    accountController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Container(
            height: ScreenUtil.getInstance().screenHeight,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().getWidth(dimen_16)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().getWidth(dimen_12),
                            bottom:
                                ScreenUtil.getInstance().getWidth(dimen_32)),
                        width: ScreenUtil.getInstance().getWidth(dimen_180),
                        height: ScreenUtil.getInstance().getWidth(dimen_180),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(PathConstant.logoAppPath),
                          ),
                        ),
                      ),
                      AppTextField(
                        controller: accountController,
                        textHint: AppLocalizations.of(context)!.signup_fullName,
                        pathIcon: PathConstant.userIconPath,
                        textStyle: TxtStyle.textBlue(),
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().getWidth(dimen_16),
                      ),
                      AppTextField(
                        controller: emailController,
                        textHint: AppLocalizations.of(context)!.signup_email,
                        pathIcon: PathConstant.emailIconPath,
                        textStyle: TxtStyle.textBlue(),
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().getWidth(dimen_16),
                      ),
                      AppTextField(
                        controller: phoneController,
                        textHint: AppLocalizations.of(context)!.signup_phone,
                        pathIcon: PathConstant.smartPhoneIconPath,
                        textStyle: TxtStyle.textBlue(),
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().getWidth(dimen_16),
                      ),
                      AppTextField(
                        controller: passwordController,
                        textHint: AppLocalizations.of(context)!.signup_pass,
                        pathIcon: PathConstant.lockIconPath,
                        textStyle: TxtStyle.textBlue(),
                        isPassword: true,
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().getWidth(dimen_16),
                      ),
                      AppTextField(
                        controller: confirmPasswordController,
                        textHint:
                            AppLocalizations.of(context)!.singup_confirmPass,
                        pathIcon: PathConstant.lockIconPath,
                        textStyle: TxtStyle.textBlue(),
                        isPassword: true,
                      ),
                      SizedBox(
                        height: dimen_16,
                      ),
                      AppButton(
                        text: AppLocalizations.of(context)!.signup_create,
                        textStyle: BtnStyle.text600Size20(),
                        onPressed: () {
                          print("Đăng nhập thành công");
                        },
                      ),
                      SizedBox(
                        height: ScreenUtil.getInstance().getWidth(dimen_24),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil.getInstance().getWidth(dimen_00),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).padding.bottom),
                    alignment: AlignmentDirectional.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.signup_already_account,
                          style: TxtStyle.text400Size16Black(),
                        ),
                        SizedBox(
                          width: dimen_06,
                        ),
                        AppTextLining(
                          text: AppLocalizations.of(context)!.sigup_login,
                          textStyle: TxtStyle.text600Size16Blue(),
                          onPressed: () {
                            Navigator.popAndPushNamed(context, RouteName.login);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    accountController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
