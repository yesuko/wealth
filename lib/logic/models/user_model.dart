class UserModel {
  final String firstName, lastName, phoneNumber, userType, email;
  String uid;

  UserModel.attributes({
    this.uid = "",
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userType,
    required this.email,
  });

  UserModel()
      : uid = "",
        firstName = "",
        lastName = "",
        phoneNumber = "",
        userType = "",
        email = "";
}
