class UsersWhoBoughtTheTickectModel {
  static const USERID = "id";
  static const USERNAME = "name";
  static const USEREMAIL = "email";

  String? id;
  String? email;
  String? name;

  UsersWhoBoughtTheTickectModel({
    this.id,
    this.email,
    this.name,
  });

  UsersWhoBoughtTheTickectModel.fromMap(Map<String, dynamic> data) {
    id = data[USERID];
    email = data[USEREMAIL];
    name = data[USERNAME];
  }
}
