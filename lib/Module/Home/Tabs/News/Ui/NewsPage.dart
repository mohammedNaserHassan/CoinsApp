import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:coins_app/Module/Home/Tabs/News/newsController.dart';
import 'package:coins_app/Module/Home/Tabs/News/Ui/NewsDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsController>(
        init: NewsController(),
        builder: (getx) {
          return Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  toolbarHeight: 80.h,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Text(
                    ' اخبـار وتقارير',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                body:  RefreshIndicator(
                      onRefresh: () async {
                        getx.setLength();
                      },
                      child: ListView(
                        children: [
                          getx.news.isEmpty
                              ? Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: getx.newsLength,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      getx.setDetails(index: index);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 94.h,
                                            width: 123.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      'assets/images/Bitmap.png',
                                                    ),
                                                    fit: BoxFit.fill)),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin:
                                                  EdgeInsetsDirectional.only(
                                                      start: 10.w),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getx.news[index].sTitle ??
                                                        '',
                                                    style: TextStyle(
                                                        fontSize: 15.sp),
                                                  ),
                                                  Text(
                                                    getx.news[index]
                                                            .dtCreatedDate ??
                                                        '',
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        color: Colors.grey),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ],
                      ),
                ),
              ),
              Visibility(visible: getx.isDetails, child: NewsDetails())
            ],
          );
        });
  }
}
