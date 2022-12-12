import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golfanalysis_jpn/features/home/home.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  static GoRoute route() {
    return GoRoute(
        path: '/result',
        builder: (BuildContext context, GoRouterState state) {
          return const ResultPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const ResultView();
  }
}

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/result/result_img.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Text(
                    'Details:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '79* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  Text(
                    '56* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  Text(
                    '25* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(height: 100, width: 2, color: Colors.black),
                ],
              ),
              Column(
                children: const [
                  Text(
                    'Details:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '79* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  Text(
                    '56* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                  Text(
                    '25* Lorem Ipsum',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        height: 1.4666666666666666),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
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
                  'HOME',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 23,
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
