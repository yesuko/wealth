import 'package:wealth/logic/logic_validator.dart';

class IncomeSourceModel  {
  String _name;
  final DateTime _createdOn;
  double _income;
  final Map<DateTime, double> _record;

  IncomeSourceModel.withAttibutes({
    required String name,
    required DateTime createdOn,
    double income = 0.0,
    Map<DateTime, double> record = const {},
  })  : _name = _validateName(name),
        _income = LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(income),
        _createdOn = _validateDate(createdOn),
        _record = record;

  static String _validateName(String name) {
    assert(name.isNotEmpty, "Name cannot be empty");
    if (name.isEmpty) {
      throw Exception("Name can not be empty");
    }
    return name;
  }

  static DateTime _validateDate(DateTime dt) {
    //DateTime now = DateTime.now();
    //assert(dt.isAfter(now), "CreatedOn cannot be null");
    // if (dt.isBefore(DateTime.now())) {
    //   throw Exception("Date is invalid");
    // }
    return dt;
  }

  static Map<DateTime, double> _validateRecordAttributes(
      DateTime dt, double income) {
    double i = LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(income);
    DateTime d = _validateDate(dt);
    return {d: i};
  }

  set income(double income) {
    _income = LogicValidator.validateAmountAndRoundToTwoDecimalPlaces(income);
  }

  set name(String name) {
    _name = _validateName(name);
  }

  updateRecord(DateTime dt, double income) {
    _validateRecordAttributes(dt, income);
    _record.putIfAbsent(dt, () => income);
  }

  

  String get name => _name;
  DateTime get createdOn => _createdOn;
  double get income => _income;
  Map<DateTime, double> get record => _record;
}
