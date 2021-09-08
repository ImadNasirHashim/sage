class AppUser{
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  String? description;
  String? password;
  String? confirmPassword;

  AppUser({
    this.id,
    this.email,
    this.userName,
    this.phoneNumber,
    this.description,
    this.password,
    this.confirmPassword,
  });
}