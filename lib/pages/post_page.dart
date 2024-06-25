import 'package:apicall_test/service/post_api_service.dart';
import 'package:flutter/material.dart';
import 'package:apicall_test/model/post_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {


  @override
  List<PostModel> posts=[];

  void initState() {
    // TODO: implement initState
    super.initState();
    fetch();
  }

  fetch() async{
    final post=await PostApiService.postFetch();
    // print(post);
    setState(() {
      posts=post??[];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post api',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(posts[index].title),
          ),
        );
      },)
    );
  }
}
