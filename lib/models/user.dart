import '../string_utils.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;
  List<User> friends = [];

  String _firstName;
  String _lastName;

  LoginType _type;

  User._internal(
      {String firstName, String lastName, String email, String phone})
      : _firstName = firstName,
        _lastName = lastName,
        this.email = email,
        this.phone = phone {
    print('User is created');
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String email, String phone}) {
    if (name.isEmpty) throw Exception('User name is empty');
    if (email.isEmpty || phone.isEmpty)
      throw Exception('phone or email is empty');

    return User._internal(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      phone: _checkPhone(phone),
      email: _checkEmail(email),
    );
  }

  static String _getFirstName(String userName) => userName.split(' ')[0];

  static String _getLastName(String userName) => userName.split(' ')[1];

  static String _checkPhone(String phone) {
    String checkPattern = r'^(?:[+0])?[0-9]{11}';
    String clearPattern = r'[^+\\d]';

    phone = phone.replaceAll(clearPattern, '');

    if (phone == null || phone.isEmpty) {
      throw Exception('Enter don\'t empty phone number');
    } else if (!RegExp(checkPattern).hasMatch(phone)) {
      throw Exception(
          'Enter a valid phone number starting with + and containing 11 digits');
    }

    return phone;
  }

  static String _checkEmail(String email) {
    if (email == null || email.isEmpty) {
      throw Exception('Enter don\'t empty email number');
    }

    return email;
  }

  String get login => _type == LoginType.phone ? phone : email;

  String get name => '${_firstName.capitalize()} ${_lastName.capitalize()}';

  String get userInfo => '''
    name: $name
    email: $email
    firstName: $_firstName
    lastName: $_lastName
    friends: ${friends.toList()}
  ''';

  void addFriends(Iterable<User> newFriends) {
    friends.addAll(newFriends);
  }

  void removeFriend(User friend) {
    friends.remove(friend);
  }

  @override
  String toString() {
    return '''
      name: $name
      email: $email
      friends: ${friends.toList()}
  ''';
  }

  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }

    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._firstName &&
          (phone == object.phone || email == object.email);
    }
  }
}
