import 'dart:async';
import 'dart:convert' show json;
import 'package:book_manager/main.dart';
import 'package:book_manager/shared/validate/validate.dart';
import 'package:book_manager/shared/widget/widgets.dart';
import 'package:book_manager/shared/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final referenceDatabase = FirebaseDatabase.instance;
  late TextEditingController emailController, passwordController;
  final _auth = FirebaseAuth.instance;
  final _facebooklogin = FacebookLogin();
  GoogleSignInAccount? _currentUser;
  // ignore: unused_field
  String _contactText = '';
  // ignore: unused_field
  bool _isLoggedIn = false;
  // ignore: unused_field
  String? _message;
  bool isCheck = false;

  Future _loginWithFacebook() async {
    final result = await _facebooklogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    if (result.status == FacebookLoginStatus.success) {
      final credential = FacebookAuthProvider.credential(
        result.accessToken!.token,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      setState(() {
        _message = "Logged in as  ${user!.displayName}";
        _isLoggedIn = true;
        print("Đăng nhập Facebook thành công!!!");
      });
    }
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    setState(() {
      _contactText = "Loading contact info...";
    });
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        _contactText = "People API gave a ${response.statusCode} "
            "response. Check logs for details.";
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        _contactText = "I see you know $namedContact!";
      } else {
        _contactText = "No contacts to display.";
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'];
    final Map<String, dynamic>? contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic>? name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> _loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  var _valueController = StreamController<String>();
  Stream<String> get valueStream => _valueController.stream;
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              height: ScreenUtil.getInstance().screenHeight,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewPadding.top,
                          right: ScreenUtil.getInstance().getWidth(dimen_16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => MyApp.of(context).setLocale(
                                  Locale.fromSubtags(languageCode: 'vi')),
                              child: Image.asset(
                                PathConstant.languageViPath,
                                width:
                                    ScreenUtil.getInstance().getWidth(dimen_24),
                                height:
                                    ScreenUtil.getInstance().getWidth(dimen_24),
                              ),
                            ),
                            SizedBox(
                              width:
                                  ScreenUtil.getInstance().getWidth(dimen_08),
                            ),
                            InkWell(
                              onTap: () => MyApp.of(context).setLocale(
                                  Locale.fromSubtags(languageCode: 'en')),
                              child: Image.asset(
                                PathConstant.languageEnPath,
                                width:
                                    ScreenUtil.getInstance().getWidth(dimen_24),
                                height:
                                    ScreenUtil.getInstance().getWidth(dimen_24),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                ScreenUtil.getInstance().getWidth(dimen_16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // user != null
                            //     ? ListTile(
                            //         leading: GoogleUserCircleAvatar(
                            //           identity: user,
                            //         ),
                            //         title: Text(user.displayName ?? ''),
                            //         subtitle: Text(user.email),
                            //       )
                            //     : Container(),
                            Container(
                              margin: EdgeInsets.all(
                                  ScreenUtil.getInstance().getWidth(dimen_30)),
                              width:
                                  ScreenUtil.getInstance().getWidth(dimen_200),
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_200),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(PathConstant.logoAppPath),
                                ),
                              ),
                            ),
                            _textFieldUser(),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                            _textFieldPassword(),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                            _textForgotPassword(),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                            _buttonLogin(),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                            Text(
                              AppLocalizations.of(context)!.login_connect_using,
                              style: TxtStyle.text400Size16Black(),
                            ),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                            _buttonSocial(),
                            SizedBox(
                              height:
                                  ScreenUtil.getInstance().getWidth(dimen_16),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                            AppLocalizations.of(context)!.login_dont_account,
                            style: TxtStyle.text400Size16Black(),
                          ),
                          SizedBox(
                            width: ScreenUtil.getInstance().getWidth(dimen_08),
                          ),
                          AppTextLining(
                            text: AppLocalizations.of(context)!.login_singup,
                            textStyle: TxtStyle.text600Size16Blue(),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, RouteName.signUp);
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
      ),
    );
  }

  Widget _textFieldUser() {
    return AppTextField(
      controller: emailController,
      textHint: AppLocalizations.of(context)!.login_account,
      pathIcon: PathConstant.userIconPath,
      textStyle: TxtStyle.textBlue(),
      textInputType: TextInputType.emailAddress,
      onTap: () {
        print('object');
      },
    );
  }

  Widget _textFieldPassword() {
    return AppTextField(
      controller: passwordController,
      textHint: AppLocalizations.of(context)!.login_password,
      pathIcon: PathConstant.lockIconPath,
      textStyle: TxtStyle.textBlue(),
      isPassword: true,
      onTap: () {
        print('object');
      },
    );
  }

  Widget _textForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppTextLining(
          text: AppLocalizations.of(context)!.login_forget_password,
          textStyle: TxtStyle.text400Size14Black(),
          onPressed: () {
            print('object');
          },
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return AppButton(
      text: AppLocalizations.of(context)!.login_login,
      textStyle: BtnStyle.text600Size20(),
      onPressed: () {
        if (CheckValidate().validateEmail(emailController.text)) {
          Navigator.pushReplacementNamed(context, RouteName.myMain);
        } else {
          AlertDialogApp().showAlert(
            context: context,
            title: 'Thông báo',
            description: 'Email không đúng định dạng',
          );
        }
      },
    );
  }

  Widget _buttonSocial() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getWidth(dimen_24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButtonSocial(
            text: 'Facebook',
            width: ScreenUtil.getInstance().screenWidth / 2.9,
            textStyle: BtnStyle.normal(),
            pathIcon: PathConstant.facebookIconPath,
            backgroundColor: AppColor.systemColorBlue,
            onPressed: () {
              _loginWithFacebook();
            },
          ),
          AppButtonSocial(
            text: 'Google',
            width: ScreenUtil.getInstance().screenWidth / 3,
            textStyle: BtnStyle.normal(),
            backgroundColor: AppColor.systemColorRed,
            pathIcon: PathConstant.googleIconPath,
            onPressed: () {
              _loginWithGoogle();
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _valueController.close();
    super.dispose();
  }
}
