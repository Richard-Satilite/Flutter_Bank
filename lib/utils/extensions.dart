extension ExtString on String {
  bool get isValidAPI {
    final APIRegex = RegExp(r"^ghp_[a-zA-Z0-9]{36}$");
    return APIRegex.hasMatch(this);
  }

  bool get isValidNameLastName {
    return this.isNotEmpty;
  }
}
