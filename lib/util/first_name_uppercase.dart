firstNameUpperCase(String name) {
  if (name.isNotEmpty) {
    var firstLetter = name.substring(0, 1).toUpperCase() + name.substring(1);
    return firstLetter;
  } else {
    return;
  }
}
