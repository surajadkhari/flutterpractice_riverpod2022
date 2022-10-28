import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'consumerwidget.dart';
import 'homepage.dart';
import 'riverpod/riverpod_home.dart';

void main() {
  runApp(const ProviderScope(child: Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Hompage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
