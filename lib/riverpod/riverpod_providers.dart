import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod2022/riverpod/riverpod_model.dart';

import 'riverpod_json.dart';

//FutreProvider

final commentProvider =
    FutureProvider.family<List<commentModel>, int>((ref, id) async {
  return ref.read(databaseProvider).fetchComment(id: id);
});

final postProvider = FutureProvider((ref) async {
  return ref.read(databaseProvider).fetchPost();
});
