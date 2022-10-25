import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<CoinsController>(
        init: CoinsController(),
        builder:(getx)=> Scaffold(
          body: getx.pages[getx.pageIndex],
            bottomNavigationBar: Container(
          height: 83.h,
          color: Colors.grey.shade50
              ,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        getx.setPageIndex(0);
                      },
                      icon: getx.pageIndex == 0
                          ? SvgPicture.asset('assets/icons/price_bold.svg')
                          : SvgPicture.asset('assets/icons/price.svg')),
                  Text('اسعار العملات',style: TextStyle(fontSize: 8.sp,color:getx.pageIndex == 0?Colors.black: Color(0xff95989C)),)
                ],
              ),
              Column(
                children: [
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                       getx.setPageIndex(1);
                      },
                      icon: getx.pageIndex == 1
                          ? SvgPicture.asset('assets/icons/alert_bold.svg')
                          : SvgPicture.asset('assets/icons/alert.svg')),
                  Text('منبه العملات',style: TextStyle(fontSize: 8.sp,color:getx.pageIndex == 1?Colors.black: Color(0xff95989C)),)
                ],
              ),
              Column(
                children: [
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        getx.setPageIndex(2);
                      },
                      icon: getx.pageIndex == 2
                          ? SvgPicture.asset('assets/icons/news_bold.svg')
                          : SvgPicture.asset('assets/icons/news.svg')),
                  Text('اخبار وتقارير',style: TextStyle(fontSize: 8.sp,color:getx.pageIndex == 2?Colors.black: Color(0xff95989C)),)
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
