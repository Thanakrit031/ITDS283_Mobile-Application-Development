import 'package:flutter/material.dart';
import 'package:project_1/pages/home_page.dart';


class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RVmovies"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => HomePage()));
              },
              icon: const Icon(Icons.more_vert));
        }),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(6.0)),
          Card(
          child: ListTile(
            leading: Image.network('https://cdn-icons-png.flaticon.com/512/2648/2648307.png'),
            title: Text('6487031 Thanakrit Siripanjanon'),
            subtitle: Text(''),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.network('https://cdn-icons-png.flaticon.com/512/2648/2648307.png'),
            title: Text('6487057 Ravisara Wilaipong'),
            subtitle: Text(''),
          ),
        ),
        Card(
          child: ListTile(
            leading: Image.network('https://cdn-icons-png.flaticon.com/512/2648/2648307.png'),
            title: Text('6487067 Amonchai Srichaichu'),
            subtitle: Text(''),
          ),
        ),
        ],)
        ),
    );
  }
}
