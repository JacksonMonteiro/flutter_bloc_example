import 'package:bloc/app/models/user_model.dart';

abstract class UserState {
  List<UserModel> users;
  bool isLoading;
  UserState({
    required this.users,
    this.isLoading = false,
  });
}

class UserInitialState extends UserState {
  UserInitialState() : super(users: []);
}

class UserSuccessState extends UserState {
  UserSuccessState({required List<UserModel> usersList})
      : super(users: usersList);
}

class UserLoadingState extends UserState {
  UserLoadingState() : super(users: [], isLoading: true);
}
