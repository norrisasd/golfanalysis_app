import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golfanalysis_jpn/features/record/record.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  static GoRoute route() {
    return GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const GuidePage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return const GuideView();
  }
}

class GuideView extends StatelessWidget {
  const GuideView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 404,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/guide/guide_img.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width,
            child: const Text(
              'Please follow this angle',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  height: 1.4666666666666666),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordPage(
                            onVideoRecorded: (value) {},
                          )));
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
                  'Next',
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
