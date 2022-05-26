import 'package:flutter/material.dart';
import 'package:swipe_to_lock_and_sleep/my_app_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver, MyAppBehavior {


  void getRenderBoxInfoAndSliderRange() {
    Future.delayed(const Duration(seconds: 2), () {
      sleepSideDotTwoRenderBox = sleepSideDotTwoKey.currentContext.findRenderObject();
      sleepSideDotTwoOffset = sleepSideDotTwoRenderBox.localToGlobal(Offset.zero);

      sliderRenderBox = sliderKey.currentContext.findRenderObject();
      sliderOffset = sliderRenderBox.localToGlobal(Offset.zero);

      sliderRange = (sleepSideDotTwoOffset.dx + (sleepSideDotTwoRenderBox.size.width / 2)) - (sliderOffset.dx + (sliderRenderBox.size.width / 2));
    });
  }

  @override
  void initState() {
    sleepSideDotTwoKey = GlobalKey();
    sliderKey = GlobalKey();

    WidgetsBinding.instance.addObserver(this);
    getRenderBoxInfoAndSliderRange();

    super.initState();
  }

  @override
  void didChangeMetrics() {
    getRenderBoxInfoAndSliderRange();
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('swipe lock/sleep'),
      ),
      body: Center(
        child: Container(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              lockWidth = constraints.maxWidth * 0.07;
              lockHeight = constraints.maxHeight * 0.07;
              lockSideDotOneWidth = constraints.maxWidth * 0.02;
              lockSideDotOneHeight = constraints.maxHeight * 0.02;
              lockSideDotTwoWidth = constraints.maxWidth * 0.02;
              lockSideDotTwoHeight = constraints.maxHeight * 0.02;

              sleepWidth = constraints.maxWidth * 0.07;
              sleepHeight = constraints.maxHeight * 0.07;
              sleepSideDotOneWidth = constraints.maxWidth * 0.02;
              sleepSideDotOneHeight = constraints.maxHeight * 0.02;
              sleepSideDotTwoWidth = constraints.maxWidth * 0.02;
              sleepSideDotTwoHeight = constraints.maxHeight * 0.02;

              sliderWidth = constraints.maxWidth * 0.25;
              sliderHeight = constraints.maxHeight * 0.25;

              sliderIconSize = (constraints.maxWidth < constraints.maxHeight) ? (constraints.maxWidth * 0.10) : (constraints.maxHeight * 0.10);

              return Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: (lockWidth < lockHeight)
                                  ? lockWidth
                                  : lockHeight,
                              height: (lockWidth < lockHeight)
                                  ? lockWidth
                                  : lockHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(((lockWidth < lockHeight) ? lockWidth : lockHeight) / 2),
                              ),
                              child: Icon(Icons.lock_open, size: ((lockWidth < lockHeight) ? lockWidth : lockHeight) * 0.90,),
                            ),
                            Container(
                              width:
                                  (lockSideDotOneWidth < lockSideDotOneHeight)
                                      ? lockSideDotOneWidth
                                      : lockSideDotOneHeight,
                              height:
                                  (lockSideDotOneWidth < lockSideDotOneHeight)
                                      ? lockSideDotOneWidth
                                      : lockSideDotOneHeight,
                              decoration: BoxDecoration(
                                color: lockSideLeftDotColor,
                                borderRadius: BorderRadius.circular(
                                    ((lockSideDotOneWidth <
                                                lockSideDotOneHeight)
                                            ? lockSideDotOneWidth
                                            : lockSideDotOneHeight) /
                                        2),
                              ),
                            ),
                            Container(
                              width:
                                  (lockSideDotTwoWidth < lockSideDotTwoHeight)
                                      ? lockSideDotTwoWidth
                                      : lockSideDotTwoHeight,
                              height:
                                  (lockSideDotTwoWidth < lockSideDotTwoHeight)
                                      ? lockSideDotTwoWidth
                                      : lockSideDotTwoHeight,
                              decoration: BoxDecoration(
                                color: lockSideRightDotColor,
                                borderRadius: BorderRadius.circular(
                                    ((lockSideDotTwoWidth <
                                                lockSideDotTwoHeight)
                                            ? lockSideDotTwoWidth
                                            : lockSideDotTwoHeight) /
                                        2),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width:
                                  (sleepSideDotTwoWidth < sleepSideDotTwoHeight)
                                      ? sleepSideDotTwoWidth
                                      : sleepSideDotTwoHeight,
                              height:
                                  (sleepSideDotTwoWidth < sleepSideDotTwoHeight)
                                      ? sleepSideDotTwoWidth
                                      : sleepSideDotTwoHeight,
                              decoration: BoxDecoration(
                                color: sleepSideLeftDotColor,
                                borderRadius: BorderRadius.circular(
                                    ((sleepSideDotTwoWidth <
                                                sleepSideDotTwoHeight)
                                            ? sleepSideDotTwoWidth
                                            : sleepSideDotTwoHeight) /
                                        2),
                              ),
                            ),
                            Container(
                              key: sleepSideDotTwoKey,
                              width:
                                  (sleepSideDotOneWidth < sleepSideDotOneHeight)
                                      ? sleepSideDotOneWidth
                                      : sleepSideDotOneHeight,
                              height:
                                  (sleepSideDotOneWidth < sleepSideDotOneHeight)
                                      ? sleepSideDotOneWidth
                                      : sleepSideDotOneHeight,
                              decoration: BoxDecoration(
                                color: sleepSideRightDotColor,
                                borderRadius: BorderRadius.circular(
                                    ((sleepSideDotOneWidth <
                                                sleepSideDotOneHeight)
                                            ? sleepSideDotOneWidth
                                            : sleepSideDotOneHeight) /
                                        2),
                              ),
                            ),
                            Container(
                              width: (sleepWidth < sleepHeight)
                                  ? sleepWidth
                                  : sleepHeight,
                              height: (sleepWidth < sleepHeight)
                                  ? sleepWidth
                                  : sleepHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ((sleepWidth < sleepHeight)
                                            ? sleepWidth
                                            : sleepHeight) /
                                        2),
                              ),
                              child: Icon(Icons.nightlight_round, size: ((sleepWidth < sleepHeight) ? sleepWidth : sleepHeight) * 0.90,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    key: sliderKey,
                    onPanUpdate: (details) {
                      setState(() {
                        x = x + details.delta.dx;

                        if (((x > 0) ? x : -x) >= sliderRange) {
                          if (x > 0) {
                            x = sliderRange;
                            sliderColor = Colors.yellow;
                            sliderIcon = Icons.nightlight_round;
                            sleepSideLeftDotColor = Colors.black26;
                            sleepSideRightDotColor = Colors.red;
                            lockSideLeftDotColor = Colors.black26;
                            lockSideRightDotColor = Colors.red;
                          } else {
                            x = -sliderRange;
                            sliderColor = Colors.lightGreenAccent;
                            sliderIcon = Icons.lock_open;
                            lockSideLeftDotColor = Colors.red;
                            lockSideRightDotColor = Colors.black26;
                            sleepSideLeftDotColor = Colors.red;
                            sleepSideRightDotColor = Colors.black26;
                          }
                        }
                      });
                    },
                    onPanEnd: (details) {
                      setState(() {
                        x = 0.0;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        sliderIcon = Icons.lock;
                        sliderColor = Colors.white;
                        lockSideLeftDotColor = Colors.black26;
                        lockSideRightDotColor = Colors.red;
                        sleepSideLeftDotColor = Colors.red;
                        sleepSideRightDotColor = Colors.black26;
                      });
                    },
                    child: Transform(
                      transform: Matrix4.identity()..translate(x),
                      child: Container(
                        width: (sliderWidth < sliderHeight)
                            ? sliderWidth
                            : sliderHeight,
                        height: (sliderWidth < sliderHeight)
                            ? sliderWidth
                            : sliderHeight,
                        decoration: BoxDecoration(
                          color: sliderColor,
                          borderRadius: BorderRadius.circular(
                            (((sliderWidth < sliderHeight)
                                    ? sliderWidth
                                    : sliderHeight) /
                                2),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Icon(sliderIcon, size: sliderIconSize,),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}