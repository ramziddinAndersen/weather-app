class Validators {
  static bool isStringNotEmpty(String? value) {
    if (value == null) return false;

    return value.isNotEmpty;
  }

  static bool isListNotEmpty(dynamic list) {
    if (list == null) return false;

    return list.isNotEmpty;
  }
}
