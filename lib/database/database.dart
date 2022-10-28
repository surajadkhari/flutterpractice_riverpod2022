// ignore: deprecated_member_use
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final databaseProvider = Provider<Database>((ref) => Database());
final setProvider =
    StateNotifierProvider<Database, dynamic>((ref) => Database());

class Database extends StateNotifier<dynamic> {
  Database() : super({'name': 'tester', 'id': 2});
  String? props1;
  int? props2;
  bool? props3 = false;

  Future<String> getData() {
    return Future.delayed(Duration(seconds: 2), () {
      return "Hello Flutter";
    });
  }

  Future fetchData() async {
    var url = "https://jsonplaceholder.typicode.com/posts";
    var response = await get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    return jsonData;
  }

  void change() {
    state = {...state, 'name': state['name'] + ' added'};
    props3 = !props3!;
    print(props3);
  }
}


//StateNotifierProvider

final counterController =
    StateNotifierProvider<counterNotifier, dynamic>((ref) => counterNotifier());

class counterNotifier extends StateNotifier<int> {
  counterNotifier() : super(0);

  void add() {
    state = state + 1;
  }

  void subtract() {
    state = state - 1;
  }
}
