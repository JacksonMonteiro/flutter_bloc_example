import 'dart:async';

import 'package:bloc/app/blocs/users/user_state.dart';
import 'package:bloc/app/blocs/users/users_events.dart';
import 'package:bloc/app/models/user_model.dart';
import 'package:bloc/app/services/interfaces/base_service_interface.dart';
import 'package:bloc/app/services/user_service.dart';

class UserBloc {
  final IBaseInterface _service = UserService();

  // Controles de input e outputs
  final StreamController<UserEvent> _inputUserController = StreamController<UserEvent>();
  final StreamController<UserState> _outputUserController = StreamController<UserState>();

  // Saida (Stream) e entrada (Sink)
  Sink<UserEvent> get inputUser => _inputUserController.sink;
  Stream<UserState> get stream => _outputUserController.stream;

  UserBloc() {
    _inputUserController.stream.listen(_mapEventToState);
  } 

  _mapEventToState(UserEvent event)  {
    _outputUserController.add(UserLoadingState());
    
    List<UserModel> users = [];

    if (event is LoadUsersEvent) {
      users = _service.get() as List<UserModel>;
    } else if (event is AddUserEvent) {
      users = _service.add(event.user) as List<UserModel>;
    } else if (event is RemoveUserEvent) {
      users = _service.remove(event.user) as List<UserModel>;
    }

    _outputUserController.add(UserSuccessState(usersList: users));
  }
}