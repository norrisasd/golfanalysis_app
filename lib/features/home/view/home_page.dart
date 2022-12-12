import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golfanalysis_jpn/features/guide/guide.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static GoRoute route() {
    return GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 505,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home/home_img.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GuidePage()));
            },
            child: Container(
              width: 271,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: const Center(
                child: Text(
                  'START',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 1.4666666666666666),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
