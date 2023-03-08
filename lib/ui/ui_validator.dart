class UIValidator {
  static validateName(String? name) {
    if (name == null) {
      return "Enter valid name";
    } else if (name.isEmpty) {
      return "Name field can not be empty";
    } else {
      return;
    }
  }

  static validateAmount(String? amount) {
    if (amount == null) {
      return "Enter a valid amount";
    } else if (amount.isEmpty) {
      return "Amount field can not be empty";
    } else {
      double amt = double.parse(amount);
      if (amt < 0) {
        return "amount can not be a negative number";
      } else {
        return;
      }
    }
  }

  static validatePhoneNumber(String? number) {
    if (number == null) {
      return "Enter a valid number";
    } else if (number.isEmpty) {
      return "Phone number field can not be empty";
    } else if (RegExp(r'^[0-9]{10}$').hasMatch(number)) {
      return;
    } else {
      return "Enter a valid phone number";
    }
  }

  static validateEmail(String? email) {
    if (email == null) {
      return "Enter a valid email";
    } else if (email.isEmpty) {
      return "Email field can not be empty";
    } else if (RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      return;
    } else {
      return "Enter a valid email";
    }
  }

  static validatePassword(String? password) {
    if (password == null) {
      return "Enter a valid password";
    } else if (password.isEmpty) {
      return "Password field can not be empty";
    } else if (RegExp(r'^.{6,}$').hasMatch(password)) {
      return;
    } else {
      return "Enter a password with length at least 6";
    }
  }

  static validateConfirmPassword(String? confirmPass, String? password) {
    if (confirmPass == null) {
      return "Enter a valid password";
    } else if (confirmPass.isEmpty) {
      return "Password field can not be empty";
    } else if (RegExp(r'^.{6,}$').hasMatch(confirmPass) &&
        confirmPass == password) {
      return;
    } else if (password != confirmPass) {
      return "Password doesn't match";
    } else {
      return "Enter a password with length at least 6";
    }
  }
}
