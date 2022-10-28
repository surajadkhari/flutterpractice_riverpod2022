import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Changenotifier extends ChangeNotifier {
  bool loading = false;
  Future<void> changeStatus() async {
    loading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));

    loading = false;
    notifyListeners();
  }
}

final changeStatus =
    ChangeNotifierProvider<Changenotifier>((ref) => Changenotifier());
