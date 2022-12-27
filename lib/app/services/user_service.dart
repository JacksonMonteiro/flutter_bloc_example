import 'package:bloc/app/models/user_model.dart';
import 'package:bloc/app/services/interfaces/base_service_interface.dart';

class UserService implements IBaseInterface {
  final List<UserModel> _users = [
    UserModel(name: 'Jackson'),
    UserModel(name: 'Samyra'),
    UserModel(name: 'Laysa'),
  ];
  
  @override
  List add(data) {
    _users.add(data as UserModel);
    return _users;
  }
  
  @override
  List remove(data) {
    _users.remove(data as UserModel);
    return _users;
  }
  
  @override
  List<UserModel> get() {
    return _users;
  }

}