import 'dart:convert';

import 'package:apicall_test/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostApiService{
  static Future<List<PostModel>?> postFetch() async{
    final url= Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response=await http.get(url);

    final jsonPost=jsonDecode(response.body);
    final getPosts=jsonPost as List;
    return getPosts.map((post)=>PostModel(id: post['id'], body: post['body'], title: post['title'])).toList();
  }
}