import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Home/MainHome/MainPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Get.offAll(MainPage()));
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset('assets/images/orange.png',
                            fit: BoxFit.fill),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/blue.png',
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/images/pink.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Image.asset('assets/images/green.png',
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: RichText(
                  text: TextSpan(
                text: 'بلوك ',
                style: TextStyle(color: Colors.white, fontSize: 24),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  TextSpan(text: ' تشين'),
                ],
              )),
            ),
            PositionedDirectional(
                bottom: ScreenUtil.defaultSize.height * 0.25,
                start: ScreenUtil.defaultSize.width * 0.33,
                child: Image.asset('assets/images/rectangle.png'))
          ],
        ),
      ),
    );
  }
}
