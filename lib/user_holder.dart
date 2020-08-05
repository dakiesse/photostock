import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);

    if (!users.containsKey(user.login)) {
      users[user.login] = user;
    } else {
      throw Exception('User with this name already exists');
    }
  }

  User registerUserByEmail(String name, String email) {
    User user = User(name: name, email: email);

    if (!users.containsKey(user.email)) {
      return users[user.email] = user;
    } else {
      throw Exception('A user with this email already exists');
    }
  }

  User registerUserByPhone(String name, String phone) {
    User user = User(name: name, phone: phone);

    if (!users.containsKey(user.phone)) {
      return users[user.phone] = user;
    } else {
      throw Exception('A user with this phone already exists');
    }
  }

  User getUserByLogin(String login) {
    if (users.containsKey(login)) {
      return users[login];
    }
  }
}
