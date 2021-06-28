import 'dart:async';
import 'dart:convert' show json;
import 'package:book_manager/shared/widget/widgets.dart';
import 'package:book_manager/shared/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import "package:http/http.dart" as http;

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
  late TextEditingController emailController,
      passwordController,
      testCotroller,
      testCotroller1;
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
  String _singleValue = 'Nữ';
  String groupValue = 'Java';

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
    testCotroller = TextEditingController();
    testCotroller1 = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    // GoogleSignInAccount? user = _currentUser;
    final availableHeight = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.backgroundColor,
            ),
            padding: const EdgeInsets.all(dimen_32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // CountDown(
                //   duration: Duration(
                //     hours: 2,
                //     minutes: 59,
                //     seconds: 59,
                //     milliseconds: 999,
                //   ),
                // ),
                // user != null
                //     ? ListTile(
                //         leading: GoogleUserCircleAvatar(
                //           identity: user,
                //         ),
                //         title: Text(user.displayName ?? ''),
                //         subtitle: Text(user.email),
                //       )
                //     : Container(),
                // Container(
                //   margin: const EdgeInsets.all(dimen_50),
                //   width: dimen_200,
                //   height: dimen_200,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     image: DecorationImage(
                //       image: AssetImage(PathConstant.logoAppPath),
                //     ),
                //   ),
                // ),
                ApplicationBar(
                  currentStep: 2,
                  width: 400,
                  title: '',
                ),
                VietlottRadioListTile(
                  scrollDirection: Axis.horizontal,
                  // textOverflow: TextOverflow.ellipsis,
                  textStyle: TxtStyle.textBlue(),
                  itemExtent: 130,
                  // horizontalTitleGap: 100.0,
                  // isDisable: true,
                  listRadio: [
                    // 'Vũ Diệu Linh',
                    'Nam',
                    ' Nữ',
                    // 'Android',
                    // 'Swift',
                    // 'Kotlin',
                    // 'React Native',
                  ],
                  groupValue: groupValue,
                  onChanged: (value) {
                    print('linhhhhhh ' + value.toString());
                  },
                ),
                // StreamBuilder(
                //     stream: valueStream,
                //     builder: (BuildContext context,
                //         AsyncSnapshot<dynamic> snapshot) {
                //       if (snapshot.hasData) {
                //         groupValue = snapshot.data as String;
                //       }
                //       return ListRadio(
                //         scrollDirection: Axis.horizontal,
                //         textOverflow: TextOverflow.ellipsis,
                //         // textStyle: TxtStyle.textBlue(),
                //         listRadio: [
                //           'Nguyễn Vũ Diệu Linh',
                //           'Java',
                //           'Flutter',
                //           'Android',
                //           'Swift',
                //           'Kotlin',
                //           'React Native',
                //         ],
                //         groupValue: groupValue,
                //         onResult: (value) {
                //           _valueController.add(value.toString());
                //           print('linhhhhhh ' + value.toString());
                //         },
                //       );
                //     }),
                _textFieldUser(),
                SizedBox(
                  height: dimen_16,
                ),
                _textFieldPassword(),
                SizedBox(
                  height: dimen_16,
                ),
                _textForgotPassword(),
                SizedBox(
                  height: dimen_16,
                ),
                // _inputFieldWidget(),
                // SizedBox(
                //   height: dimen_16,
                // ),
                // _inputFieldWidget1(),
                // SizedBox(
                //   height: dimen_16,
                // ),
                _buttonLogin(),
                SizedBox(
                  height: dimen_32,
                ),
                Text('Or connect using'),
                SizedBox(
                  height: dimen_16,
                ),
                _buttonSocial(),
              ],
            ),
          ),
          Positioned(
            bottom: availableHeight,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: AppColor.back,
                      fontSize: dimen_16,
                    ),
                  ),
                  SizedBox(
                    width: dimen_06,
                  ),
                  AppTextLining(
                    text: 'Sign Up',
                    textColor: AppColor.systemColorBlue,
                    fontWeight: FontWeight.w600,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RouteName.signUp);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldUser() {
    return AppTextField(
      controller: emailController,
      textHint: 'Email',
      pathIcon: PathConstant.userIconPath,
      textStyle: TxtStyle.textBlue(),
      textInputType: TextInputType.emailAddress,
      onTap: () {
        print('object');
      },
    );
  }

  Widget _inputFieldWidget() {
    return AppInputField(
      controller: testCotroller,
      textHint: 'Username',
      textStyle: TxtStyle.textFieldGrey(),
      isImageLeft: true,
      pathIconLeft: PathConstant.userIconPath,
      isImageRight: true,
      pathIconRight: PathConstant.dropdownIconPath,
    );
  }

  Widget _inputFieldWidget1() {
    return Container(
        // child: AppInputField(
        //   controller: testCotroller1,
        //   textHint: 'Password',
        //   textStyle: TxtStyle.textFieldGrey(),
        //   isImageLeft: true,
        //   isColorError: true,
        //   pathIconLeft: PathConstant.lockIconPath,
        //   textInputType: TextInputType.visiblePassword,
        // ),
        );
  }

  Widget _radioWidget() {
    return Container(
        // child: AppRadio(
        //   activeColor: AppColor.systemColorBlue,
        //   value: 'Nam',
        //   groupValue: _singleValue,
        //   onChanged: (value) {
        //     setSelectedRadioTile(value.toString());
        //     print('giá trị: ' + value.toString());
        //   },
        // ),
        );
  }

  Widget _radioWidget1() {
    return Container(
        // child: AppRadio(
        //   activeColor: AppColor.systemColorBlue,
        //   value: 'Nữ',
        //   groupValue: _singleValue,
        //   onChanged: (value) {
        //     setSelectedRadioTile(value.toString());
        //     print('giá trị: ' + value.toString());
        //   },
        // ),
        );
  }

  Widget _radioWidget2() {
    return Container(
        // child: AppRadio(
        //   activeColor: AppColor.systemColorBlue,
        //   value: 'Khác',
        //   groupValue: _singleValue,
        //   onChanged: (value) {
        //     setSelectedRadioTile(value.toString());
        //     print('giá trị: ' + value.toString());
        //   },
        // ),
        );
  }

  setSelectedRadioTile(String val) {
    setState(() {
      _singleValue = val;
    });
  }

  Widget _textFieldPassword() {
    return AppTextField(
      controller: passwordController,
      textHint: 'Password',
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
        _radioWidget(),
        _radioWidget1(),
        _radioWidget2(),
        AppTextLining(
          text: 'Forgot Password?',
          textColor: AppColor.back,
          textSize: dimen_14,
          onPressed: () {
            print('object');
          },
        ),
      ],
    );
  }

  Widget _buttonLogin() {
    return AppButton(
      text: 'LOGIN',
      textStyle: BtnStyle.text600Size24(),
      onPressed: () {
        print("Đăng nhập thành công");
      },
    );
  }

  Widget _buttonSocial() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: dimen_24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppButtonSocial(
            text: 'Facebook',
            textStyle: BtnStyle.normal(),
            pathIcon: PathConstant.facebookIconPath,
            backgroundColor: AppColor.systemColorBlue,
            onPressed: () {
              _loginWithFacebook();
            },
          ),
          AppButtonSocial(
            text: 'Google',
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

class RadioList {
  String value;
  int id;
  RadioList({
    required this.value,
    required this.id,
  });
}
