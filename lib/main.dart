import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_1/pages/Lobby.dart';
import 'package:project_1/pages/Login.dart';
import 'package:project_1/pages/Register.dart';
import 'package:project_1/pages/home_page.dart';
import 'package:project_1/pages/details_page.dart';
import 'package:project_1/pages/member.dart';
import 'package:project_1/pages/comment_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB0ekJ9Q17-BhRzg8YHvsa81dTKvPf-obA',
      appId: '1:164994495792:android:6cde31b5ed39531a6b44f5',
      messagingSenderId: '164994495792',
      projectId: 'e-commere-dst',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) =>  LobbyPage(),
        "/login": (BuildContext context) => LoginPage(),
        "/register": (BuildContext context) => RegisterPage(),
        "/homepage": (BuildContext context) => HomePage(),
        "/memberpage": (BuildContext context) => MemberPage(),
        "/detailpage": (BuildContext context) => DetailPage(description: '', name: '', posterurl: '', rating: '',),
        "/commentpage": (BuildContext context) => CommentPage(),
        //"/register": (BuildContext context) => LoginPage(),
      },
      initialRoute: "/",
    );
  }
}
