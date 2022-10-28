import 'package:flutter/material.dart';

import 'riverpod_home.dart';

class MyList extends StatelessWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Home(
                        id: 5,
                      )));
            },
            child: Text("5"),
          )
        ],
      ),
    );
  }
}
