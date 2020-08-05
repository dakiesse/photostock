extension ExtensionString on String {
  String capitalize() =>
      this[0].toUpperCase() + this.substring(1).toLowerCase();
}

mixin UserUtils {
  String capitalize(String s) => s.capitalize();
}
