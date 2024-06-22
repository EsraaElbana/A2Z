// abstract class AuthStates {}
// class AuthInitialsState_eng extends AuthStates {}
// class RegisterLoadingState extends AuthStates {}
// class RegisterSuccessState extends AuthStates {}
// class RegisterFailedState extends AuthStates {
//   String? message;
//   RegisterFailedState({required this.message});
// }
// class ChangeValueSuccessState extends AuthStates{}
// class LoginLoadingState extends AuthStates{}
// class LoginSuccessState extends AuthStates{}
// class FailedToLoginState extends AuthStates{
//   final String message;
//   FailedToLoginState({required this.message});
// }


abstract class AuthStates{}

class AuthInitialStates extends AuthStates{}

class RegisterLoadingStateClient extends AuthStates{}
class RegisterSuccessStateClient extends AuthStates{}
class FailedToRegisterStateClient extends AuthStates{
  final String message;
  FailedToRegisterStateClient({required this.message});
}

class ChangeValueSuccessState extends AuthStates{}
class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class FailedToLoginState extends AuthStates{
  final String message;
  FailedToLoginState({required this.message});
}