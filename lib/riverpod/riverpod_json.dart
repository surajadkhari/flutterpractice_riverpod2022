import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';


import 'riverpod_model.dart';


//provider for class DB
final databaseProvider = Provider<Db>((ref) => Db());

class Db {
  Future<List<commentModel>> fetchComment({int? id}) async {
    List<commentModel> dataList = [];
    var endpoint = "https://jsonplaceholder.typicode.com/comments?postId=$id";
    var response = await get(Uri.parse(endpoint));
    var jsonData = jsonDecode(response.body) as List;
    print(response.body);
    jsonData.forEach((i) {
      dataList.add(commentModel.fromJson(i));
    });

    return dataList;
  }

  Future fetchPost() async {
    var _endpoint = "https://jsonplaceholder.typicode.com/posts";
    var _response = await get(Uri.parse(_endpoint));
    var _jsonData = jsonDecode(_response.body);
    return _jsonData;
  }
}
