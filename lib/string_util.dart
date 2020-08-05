extension MyString on String {
  String capitalize() =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();
}

mixin UserUtils {
  String capitalize(String s) {
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }
}
