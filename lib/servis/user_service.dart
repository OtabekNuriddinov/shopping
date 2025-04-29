import 'package:shoppin/models/user_model.dart';

class UserService{

  UserService._();
  static final UserService _singleton = UserService._();
  factory UserService() => _singleton;

  final List<User> _usersList = [
    User(id: 1, name: "Otabek", email: "otabeknuriddinov7808@gmail.com", password: "Otabek7808")
  ];

  List<User> get usersList => _usersList;

  User? finding(String email, String password){
    for(User user in _usersList){
      if(user.email==email && user.password==password){
        return user;
      }
    }
    return null;
  }

  bool addUser(User newUser){
    for(User user in _usersList){
      if(newUser.email == user.email){
        return false;
      }
    }
    _usersList.add(newUser);
    return true;
  }

  bool emailChecker(String email){
    for(User user in _usersList){
      if(user.email == email){
        return true;
      }
    }
    return false;
  }

  void passwordReset(String email, String newPassword){
    for(User user in _usersList){
      if(user.email == email){
        int index = _usersList.indexOf(user);
        _usersList[index]  = user.copyWith(password: newPassword);
        break;
      }
    }
  }
}