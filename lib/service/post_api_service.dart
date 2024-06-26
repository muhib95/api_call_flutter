import 'dart:convert';

import 'package:apicall_test/model/post_model.dart';
import 'package:apicall_test/model/postdetails_model.dart';
import 'package:apicall_test/pages/post_details.dart';
import 'package:http/http.dart' as http;

class PostApiService{
  static Future<List<PostModel>?> postFetch() async{
    final url= Uri.parse('https://dummyjson.com/posts');
    final response=await http.get(url);

    final jsonPost=jsonDecode(response.body);
    // print(jsonPost['posts']);
    final getPosts=jsonPost['posts'] as List;
    return getPosts.map((post)=>PostModel(id: post['id'], body: post['body'], title: post['title'])).toList();
  }


  static Future <PostdetailsModel?> getSinglePost(String id) async{
    final url= Uri.parse('https://dummyjson.com/posts/$id');
    final response=await http.get(url);

    if(response.statusCode==200){
      final jsonDecoded=jsonDecode(response.body);
      // print(PostdetailsModel.fromJson(jsonDecoded));
      return PostdetailsModel.fromJson(jsonDecoded);

    }else{
      print('Error is ${response.body}');
    }

  }
}