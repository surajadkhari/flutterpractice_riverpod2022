import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database/database.dart';

//Provider
final nameProvider = Provider((ref) => "Hello Universe Yo");
final cityName = Provider((ref) => "Kathmandu");

//FutureProvider

final userProvider = FutureProvider((ref) async {
  return ref.read(databaseProvider).getData();
});
 
final dataProvider = FutureProvider((ref) async {
  return ref.read(databaseProvider).fetchData();
});
