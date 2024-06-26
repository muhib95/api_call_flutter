import 'package:apicall_test/service/post_api_service.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String id;

  const PostDetails({super.key, required this.id});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(id,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: FutureBuilder(future: PostApiService.getSinglePost(id), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );

        }
        else{
          print(snapshot.data?.reaction.likes);
          return Padding(
padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data?.title??"",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text(snapshot.data?.body??""),
                 Text(snapshot.data?.reaction.likes.toString()??""),
              ],
            ),
          );
        }
      },),
    );
  }
}
