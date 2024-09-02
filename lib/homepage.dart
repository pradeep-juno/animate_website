import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late ScrollController _controller;
  double pixels = 0.0;
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        print(_controller.position.pixels);
        // Trigger animation based on scroll position
        if (pixels > 100) {
          _animate = true;
        } else {
          _animate = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = 250;
    double spacing = (screenWidth - 4 * containerWidth) / 5;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.red),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left: _animate ? spacing : -200,
                    top: 100,
                    child: AnimatedOpacity(
                      opacity: _animate ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: containerWidth,
                        width: containerWidth,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left: _animate ? (spacing * 2 + containerWidth) : -200,
                    top: 100,
                    child: AnimatedOpacity(
                      opacity: _animate ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: containerWidth,
                        width: containerWidth,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left: _animate ? (spacing * 3 + containerWidth * 2) : -200,
                    top: 100,
                    child: AnimatedOpacity(
                      opacity: _animate ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: containerWidth,
                        width: containerWidth,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(seconds: 1),
                    left: _animate ? (spacing * 4 + containerWidth * 3) : -200,
                    top: 100,
                    child: AnimatedOpacity(
                      opacity: _animate ? 1.0 : 0.0,
                      duration: Duration(seconds: 1),
                      child: Container(
                        height: containerWidth,
                        width: containerWidth,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: 400,
                    color: Colors.blue,
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 500),
                    top: 50,
                    left: pixels >= 500 ? 100.0 : 0.0,
                    child: Container(
                      height: 300,
                      width: 500,
                      color: Colors.brown,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
