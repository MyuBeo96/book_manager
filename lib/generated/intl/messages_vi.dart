// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'vi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "login_account": MessageLookupByLibrary.simpleMessage("Nhập email"),
        "login_connect_using":
            MessageLookupByLibrary.simpleMessage("Hoặc đăng nhập bằng"),
        "login_dont_account":
            MessageLookupByLibrary.simpleMessage("Bạn chưa có tài khoản?"),
        "login_forget_password":
            MessageLookupByLibrary.simpleMessage("Quên mật khẩu?"),
        "login_login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
        "login_password": MessageLookupByLibrary.simpleMessage("Nhập password"),
        "login_singup": MessageLookupByLibrary.simpleMessage("Đăng ký")
      };
}
