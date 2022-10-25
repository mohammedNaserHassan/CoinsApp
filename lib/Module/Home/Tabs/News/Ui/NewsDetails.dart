import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:coins_app/Module/Home/Tabs/News/newsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetBuilder<NewsController>(
        init: NewsController(),
        builder:(getx){
         final newIndex = getx.news[getx.index];
          return Scaffold(
              appBar: AppBar(
              backgroundColor: Colors.white10,
              elevation: 0,
              actions: [
              TextButton(
              child: Text(
              'مشاركة',
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
                getx.setDetails();
          },
          ),
          ],
          leading:  TextButton(
          child: Text('عودة',
          textDirection: TextDirection.rtl,
          style: TextStyle(color: Colors.black)),
                onPressed: () {
                 getx.setDetails();
                }),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    newIndex.sTitle??'',style: TextStyle(fontSize: 20.sp),),
              ),
             Container(
               margin: EdgeInsetsDirectional.only(start: 10.w),
               child: Text(
               newIndex.dtCreatedDate??'' ,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
             ),
              Image.asset(
                'assets/images/Bitmap.png',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewWidget('مشاركة عبر فيسبوك'),
                    NewWidget('مشاركة عبر تويتر'),
                    Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(style:TextStyle(fontSize: 11.sp),
                    newIndex.sDescription??''),
              ),

            ],
          ),
        ),
      );}
    ));
  }
}

class NewWidget extends StatelessWidget {
  final String title;

  const NewWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
