import 'package:apicall_test/model/user_model.dart';
import 'package:apicall_test/service/api_service.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> users=[];
bool isLoading=false;

  @override
  void initState() {
    super.initState();
    fetch();
  }
 fetch() async{
   isLoading=true;
   final data= await ApiService.fetch();
  print(data);
  // if(data==null){
  //   isLoading=true;
  // }
  // else{
  //   isLoading=false;
  // }
  setState(() {
    users=data ?? [];
    isLoading=false;
  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Api call'),
        centerTitle: true,
      ),
      body:
      isLoading==true?
          Center(
            child: CircularProgressIndicator(),
          )
      :
      ListView.builder(
        itemCount: users.length,
        itemBuilder:
      (context, index) {
          // if(users==0){
          //   return Center(
          //     child: CircularProgressIndicator(
          //
          //     ),
          //   );
          //
          // }
        return
          Card(
          child: ListTile(
            title: Text(users[index].email),
          ),
        );


      },
      ),

    );
  }
}
