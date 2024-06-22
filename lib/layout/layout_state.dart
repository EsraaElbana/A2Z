abstract class LayoutStates{}

class LayoutInitialState extends LayoutStates{}

class GetUserDataSuccessState extends LayoutStates{}
class GetUserDataLoadingState extends LayoutStates{}
class FailedToGetUserDataState extends LayoutStates{
  String error;
  FailedToGetUserDataState({required this.error});
}

class UpdateUserDataLoadingState extends LayoutStates{}
class UpdateUserDataSuccessState extends LayoutStates{}
class UpdateUserDataWithFailureState extends LayoutStates{
  String error;

  UpdateUserDataWithFailureState(this.error);
}
class ProfilePicLoadingState extends LayoutStates{}
class profilePicSuccessState extends LayoutStates{}
class profilePicFailedState extends LayoutStates{
    String errorf;
   profilePicFailedState({required this.errorf});
}