import 'package:wealth/logic/logic_validator.dart';

abstract class Account {
  double _balance;
  double _rate;
  double _prevMonthAmount;
  int _holdWithdrawalDuration;
  static double income = 0.00;

  Account({
    double balance = 0,
    double rate = 0,
    double prevMonthAmount = 0,
    int holdWithdrawalDuration = 0,
  })  : _balance =
            LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(balance),
        _rate = _validateRate(rate),
        _holdWithdrawalDuration = _validateDuration(holdWithdrawalDuration),
        _prevMonthAmount =
            LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(
                prevMonthAmount);

  double get balance => _balance;
  double get rate => _rate;
  double get prevMonthAmount => _prevMonthAmount;
  int get holdWithdrwalDuration => _holdWithdrawalDuration;

  void withdraw(double amount) {
    if (_holdWithdrawalDuration == 0) {
      _balance -=
          LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(amount);
    } else {
      throw Exception(
          "Withdrawal is not allowed. Wait for $_holdWithdrawalDuration days.");
    }
  }

  void deposite(double amount) {
    _balance += LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(amount);
  }

  void updateBalance() {
    _balance = _rate / 100 * income;
  }

  void updatePrevMonthAmount() {
    _prevMonthAmount = _balance;
  }

  void updateRate(double rate) {
    _rate = _validateRate(rate);
  }

  void updateHoldWithdrawalDuration(int duration) {
    _holdWithdrawalDuration = _validateDuration(duration);
  }

  static int _validateDuration(int duration) {
    return duration;
  }

  static double _validateRate(double rate) {
    assert(rate >= 0, "Rate can not be negative");
    if (rate < 0) {
      throw Exception("Rate can not be negative");
    } else {
      return rate;
    }
  }
}

class SavingsAccountModel extends Account {
  SavingsAccountModel({
    double rate = 20,
    int holdWithdrawalDuration = 30,
  }) : super(
          rate: rate,
          holdWithdrawalDuration: holdWithdrawalDuration,
        );
}

class InvestmentAccountModel extends Account {
  InvestmentAccountModel({
    double rate = 30,
    holdWithdrawalDuration = 30,
  }) : super(
          rate: rate,
          holdWithdrawalDuration: holdWithdrawalDuration,
        );
}

class EmergencyAccountModel extends Account {
  EmergencyAccountModel({
    double rate = 50,
    int holdWithdrawalDuration = 0,
  }) : super(
          rate: rate,
          holdWithdrawalDuration: holdWithdrawalDuration,
        );
}
