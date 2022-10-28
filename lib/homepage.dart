import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod2022/database/database.dart';
import 'package:flutter_riverpod2022/providers.dart';

import 'change_notifier.dart';

class Hompage extends StatelessWidget {
  const Hompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Consumer2"),
      ),
      body: Column(children: [
        //Consumer Widegt Wrap garera provide ko values access garna paiyo
        Center(
          child: Consumer(builder: (context, WidgetRef ref, child) {
            return ref.watch(changeStatus).loading
                ? const CircularProgressIndicator()
                : const Text('Not loading');
          }),
        ),
        Center(
          child: Consumer(builder: (context, WidgetRef ref, child) {
            return Text(
              "${ref.watch(cityName)}Helo",
              style: const TextStyle(color: Colors.red),
            );
          }),
        ),

        // FutureProvide use grada
        Consumer(
          builder: (context, WidgetRef ref, child) {
            return ref.watch(userProvider).when(
                data: (String value) => Text(value),
                loading: () => const CircularProgressIndicator(),
                error: (Object error, StackTrace? stackTrace) {
                  return const Text("erors");
                });
          },
        ),

        //class ko property access and use of Child
        Consumer(
          builder: (context, WidgetRef ref, child) {
            return Column(
              children: [
                Text(ref.watch(setProvider).toString()),
              ],
            );
          },
          child: const Text("Test"),
        ),

        SizedBox(
          height: 300,
          width: 250,
          child: Consumer(builder: (context, WidgetRef ref, child) {
            return ref.watch(dataProvider).when(
                data: (value) {
                  return SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Text(value[index]['id'].toString());
                        },
                        itemCount: value.length),
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (Object error, StackTrace? stackTrace) {
                  return Text(error.toString());
                });
          }),
        ),
        Consumer(builder: (context, WidgetRef ref, child) {
          return ElevatedButton(
              onPressed: () => ref.read(changeStatus.notifier).changeStatus(),
              child: const Text("Change loding"));
        }),
        Consumer(builder: (context, WidgetRef ref, child) {
          return ElevatedButton(
              onPressed: () => ref.read(setProvider.notifier).change(),
              child: const Text("clcl"));
        }),
        Consumer(builder: (context, WidgetRef ref, child) {
          return Text(
            ref.watch(counterController).toString(),
            style: const TextStyle(fontSize: 30),
          );
        }),
        ElevatedButton(
          onPressed: () {
            // ref.read(counterController.notifier).add();
          },
          child: const Icon(Icons.add),
        ),
        ElevatedButton(
          onPressed: () {
            // ref.read(counterController.notifier).subtract();
          },
          child: const Icon(Icons.remove),
        )
      ]),
    );
  }
}
