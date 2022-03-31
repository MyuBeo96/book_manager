// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email`
  String get login_account {
    return Intl.message(
      'Email',
      name: 'login_account',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get login_password {
    return Intl.message(
      'Password',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get login_forget_password {
    return Intl.message(
      'Forget Password?',
      name: 'login_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login_login {
    return Intl.message(
      'Login',
      name: 'login_login',
      desc: '',
      args: [],
    );
  }

  /// `Or connect using`
  String get login_connect_using {
    return Intl.message(
      'Or connect using',
      name: 'login_connect_using',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_dont_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_dont_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get login_singup {
    return Intl.message(
      'Sign Up',
      name: 'login_singup',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get signup_fullName {
    return Intl.message(
      'Full name',
      name: 'signup_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get signup_email {
    return Intl.message(
      'Email',
      name: 'signup_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get signup_phone {
    return Intl.message(
      'Phone',
      name: 'signup_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signup_pass {
    return Intl.message(
      'Password',
      name: 'signup_pass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get singup_confirmPass {
    return Intl.message(
      'Confirm password',
      name: 'singup_confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup_create {
    return Intl.message(
      'Sign Up',
      name: 'signup_create',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signup_already_account {
    return Intl.message(
      'Already have an account?',
      name: 'signup_already_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get sigup_login {
    return Intl.message(
      'Login',
      name: 'sigup_login',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
