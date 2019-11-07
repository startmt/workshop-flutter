String validateUsername(String val) {
  if (val.isEmpty) return 'Please fill in username';
  return null;
}

String validatePassword(String val) {
  if (val.isEmpty) return 'Please fill in password';
  return null;
}
