import 'package:book_manager/shared/widget/widgets.dart';
import 'package:book_manager/shared/util.dart';
import 'package:flutter/material.dart';

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
    final availableTopHeight = MediaQuery.of(context).padding.top;
    final availableBottomHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: availableTopHeight,
            bottom: availableBottomHeight,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(
                        dimen_32, dimen_00, dimen_32, dimen_100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(dimen_50),
                          width: dimen_200,
                          height: dimen_200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(PathConstant.logoAppPath),
                            ),
                          ),
                        ),
                        AppTextField(
                          controller: accountController,
                          textHint: 'Full name',
                          pathIcon: PathConstant.userIconPath,
                          textStyle: TxtStyle.textBlue(),
                        ),
                        SizedBox(
                          height: dimen_16,
                        ),
                        AppTextField(
                          controller: emailController,
                          textHint: 'Email',
                          pathIcon: PathConstant.emailIconPath,
                          textStyle: TxtStyle.textBlue(),
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: dimen_16,
                        ),
                        AppTextField(
                          controller: phoneController,
                          textHint: 'Phone',
                          pathIcon: PathConstant.smartPhoneIconPath,
                          textStyle: TxtStyle.textBlue(),
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: dimen_16,
                        ),
                        AppTextField(
                          controller: passwordController,
                          textHint: 'Password',
                          pathIcon: PathConstant.lockIconPath,
                          textStyle: TxtStyle.textBlue(),
                          isPassword: true,
                        ),
                        SizedBox(
                          height: dimen_16,
                        ),
                        AppTextField(
                          controller: confirmPasswordController,
                          textHint: 'Confirm Password',
                          pathIcon: PathConstant.lockIconPath,
                          textStyle: TxtStyle.textBlue(),
                          isPassword: true,
                        ),
                        SizedBox(
                          height: dimen_16,
                        ),
                        AppButton(
                          text: 'CREATE',
                          textStyle: BtnStyle.text600Size24(),
                          onPressed: () {
                            print("Đăng nhập thành công");
                          },
                        ),
                        SizedBox(
                          height: dimen_32,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: AppColor.back,
                          fontSize: dimen_16,
                        ),
                      ),
                      SizedBox(
                        width: dimen_06,
                      ),
                      AppTextLining(
                        text: 'Login here',
                        textColor: AppColor.systemColorBlue,
                        fontWeight: FontWeight.w600,
                        onPressed: () {
                          Navigator.popAndPushNamed(context, RouteName.login);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
