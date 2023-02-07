class LogicValidator{
    static double validateAmountAndRoundToTwoDecimalPlaces(double income) {
    assert(income >= 0, "Amount cannot be negative");
    if (income < 0) {
      throw Exception("Amount can not be negative");
    }
    income = _convertDoubleToTwoDecimalPlaces(income);

    return income;
  }

  static double _convertDoubleToTwoDecimalPlaces(double income) {
    return double.parse(income.toStringAsFixed(2));
  }
}