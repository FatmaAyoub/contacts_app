class Validation {
  static String? emailValidation(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return 'You must input your email';
    } else {
      bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+",
      ).hasMatch(userInput);
      if (!emailValid) {
        return 'You must enter a valid Email';
      }
    }
  }
}