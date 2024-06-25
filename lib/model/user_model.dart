class UserModel{
  final int id;
  final String name;
  final String username;
  final String email;
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
});
factory UserModel.fromUser(Map<String,dynamic>u){
  return UserModel(id: u['id'], name: u['name'], username: u['username'], email: u['email']);
}
  
}