import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/shared/shared.dart';

//! create a provider for the login form
final loginFormProvider = StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>((ref) {
  return LoginFormNotifier();
});

//! create state provider for login form
class LoginFormState{
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormState({
     this.isPosting = false,
     this.isFormPosted  = false,
     this.isValid = false,
     this.email = const Email.pure(),
     this.password = const Password.pure(),
  });

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) {
    return LoginFormState(
      isPosting: isPosting ?? this.isPosting,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isValid: isValid ?? this.isValid,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }



  @override
  String toString() {
return '''
LoginFormState:
  isPosting: $isPosting,
  isFormPosted: $isFormPosted,
  isValid: $isValid,
  email: $email,
  password: $password,

''';

  }
}

//! implement a notifier for the login form
class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier() : super(LoginFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password])
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([state.email, newPassword])
    );
  }

  onFormSubmitted() {
    _touchEveryField();

    if (!state.isValid) return ;

    print(state.toString());

  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    state = state.copyWith(
      email: email,
      password: password,
      isValid: Formz.validate([email, password])
    );
  }
  


}


//! StateNotifierProvider for the login form


