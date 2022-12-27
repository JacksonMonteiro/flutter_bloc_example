import 'package:bloc/app/models/user_model.dart';

abstract class UserEvent{}

class LoadUsersEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  UserModel user;
  AddUserEvent({ required this.user });
}

class RemoveUserEvent extends UserEvent {
  UserModel user;
  RemoveUserEvent({ required this.user });
}