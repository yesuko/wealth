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
}
