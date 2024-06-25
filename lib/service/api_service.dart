import 'dart:convert';

import 'package:apicall_test/model/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService{
 static Future<List<UserModel>?> fetch () async{
    final url=Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response=await http.get(url);
    if(response.statusCode==200){

      final jsonUser=jsonDecode(response.body);
      // print(jsonUser);
      final getUsers=jsonUser as List;

      // for(var user in getUsers){
      //  users.add(UserModel.fromJson(user));
      // }
      // setState(() {
      //   users=getUsers.map((u){
      //     return UserModel.fromUser(u);
      //   }
      //
      //   ).toList();
      // });

return getUsers.map((u)=>UserModel.fromUser(u)).toList();


    }
    else{
      print('Not Success');
      return null;

    }

  }
}