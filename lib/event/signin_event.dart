import 'package:book_manager/base/base_event.dart';

class SignInEvent extends BaseEvent {
  String email;
  String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}
