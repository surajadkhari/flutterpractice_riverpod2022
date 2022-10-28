import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_providers.dart';

class Home extends StatelessWidget {
  Home({required this.id});
 final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(builder: (context, WidgetRef ref, child) {
            return ref.watch(commentProvider(id)).when(
                data: (value) {
                  return Center(
                    child: Container(
                      height: 200,
                      width: 300,
                      child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(value[index].id.toString()),
                                subtitle: Text(value[index].name));
                          }),
                    ),
                  );
                },
                loading: () => CircularProgressIndicator(),
                error: (Object error, StackTrace? stackTrace) {
                  return Text("erors");
                });
          }),
        ],
      ),
    );
  }
}
