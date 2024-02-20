import 'dart:async';
import 'dart:convert';

import 'package:flutter_examples/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository{

  Future<Iterable<PostModel>> fetchPost()async{
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final body = json.decode(response.body) as List;
      if(response.statusCode==200){
        return body.map((dynamic json){
          final map = json as Map<String,dynamic>;
          return PostModel(
            userId: map['userId']as int,
            id: map['id'] as int,
            title: map['title'] as String,
            body: map['body'] as String
          );
        }).toList();
      }
    }on TimeoutException{
      throw Exception('Error');
    }
    throw Exception('Error');
  }
}