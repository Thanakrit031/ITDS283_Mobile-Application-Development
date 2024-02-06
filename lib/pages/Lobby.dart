import 'package:flutter/material.dart';
import 'package:project_1/pages/Login.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/Logo.jpg"))),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .5,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .45,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => LoginPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(26.0),
                            child: Center(
                              child: Container(
                                  height: 62,
                                  width: 377,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      gradient: const LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 231, 200, 200),
                                            Color.fromARGB(255, 231, 200, 200),
                                            Color.fromARGB(255, 231, 200, 200)
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                  child: const Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
