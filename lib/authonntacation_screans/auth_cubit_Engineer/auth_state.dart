abstract class AuthStates_eng {}
class AuthInitialsState extends AuthStates_eng {}
class RegisterLoadingState extends AuthStates_eng {}
class RegisterSuccessState extends AuthStates_eng {}
class RegisterFailedState extends AuthStates_eng {
  String? message;
  RegisterFailedState({required this.message});
}
class ChangeValueSuccessState extends AuthStates_eng{}
class LoginLoadingStateEng extends AuthStates_eng{}
class LoginSuccessStateEng extends AuthStates_eng{}
class FailedToLoginStateEng extends AuthStates_eng{
  final String message;
  FailedToLoginStateEng({required this.message});
}