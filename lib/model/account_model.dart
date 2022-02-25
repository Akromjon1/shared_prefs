class Account{
  String id = '';
  String email = '';
  String password = '';
  String phone = '';
  String name = '';

  Account({required this.id, required this.email, required this.password, required this.name, required this.phone});
  Account.from({ required this.email, required this.phone});
  Account.fromJson(Map<dynamic, dynamic> json)
      :id = json['id'],
        email = json['email'],
        name = json['name'],
        phone = json['phone'],
        password= json['password'];

  Map<String, dynamic> toJson() => {
    'id' : id,
    'email' : email,
    'name' : name,
    'phone' : phone,
    'password' : password,
  };
}