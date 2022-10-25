import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:coins_app/Module/Home/Tabs/Prices/Controller/FavoriteController.dart';
import 'package:coins_app/Module/Home/Tabs/Prices/Controller/PriceController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'SelectionPage.dart';


class PricesPage extends StatelessWidget {
  const PricesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اسـعار العملات الالكترونية',
              style: TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                Text(
                  'آخر تحديث: ',
                  style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '09-19-2018',
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: GetBuilder<PriceController>(
        init: PriceController(),
        builder: (getx) {
          return RefreshIndicator(
            onRefresh: () async {
              return await getx.refreshCurrency();
            },
            child: ListView(
              controller: getx.scrollController,
            children: [
              GetBuilder<FavoriteController>(
                init: FavoriteController(),
  builder: (logic) {
    return GridView.builder(
                  shrinkWrap: true,
                  itemCount: logic.favoriteItems.length,
                  gridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 5 /3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
                  padding: EdgeInsets.all(10),
                  itemBuilder: (contex, index) => GestureDetector(
                    onTap: (){
                      Get.to(SelectionPage());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.orangeAccent,Colors.yellow])
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50.w,
                            height: 50.h,
                            child: Image.network(
                                logic.favoriteItems[index].sIcon ?? '',fit: BoxFit.fill,),
                          ),
                          Text(logic.favoriteItems[index].sCode??'',style: TextStyle(color: Colors.white),),
                          Text('\$  ${logic.favoriteItems[index].dTrading}',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                    ),
                  ));
  },
),
              ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h),
                      color: Color(0xffF8F9FB),
                      height: 41.h,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Center(
                              child: Text(
                                'العملة',
                                style: TextStyle(
                                    fontSize: 9.sp, color: Colors.grey),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Center(
                              child: Text('السعر',
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.grey)),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: Text('التداول',
                                  style: TextStyle(
                                      fontSize: 9.sp, color: Colors.grey)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    getx.curencces.length == 0
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            separatorBuilder: (c, m) => SizedBox(
                              height: 10.w,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getx.curencces.length,
                            itemBuilder: (BuildContext context, int index) {
                              final priceItem = getx.curencces[index];
                              num val = num.parse(priceItem.dValue ?? '');
                              num trad = num.parse(priceItem.dTrading ?? '');
                              num value =
                                  num.parse(val.toStringAsExponential(1));
                              num trading =
                                  num.parse(trad.toStringAsFixed(1));
                              return Row(
                                children: [
                                  Expanded(
                                      flex: 1, child: Text('${index + 1}')),
                                  Expanded(
                                    flex: 3,
                                    child: Image.network(
                                      priceItem.sIcon ?? '',
                                      fit: BoxFit.scaleDown,
                                      height: 20.h,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      priceItem.sCode ?? '',
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                        '  \$ ${value}',
                                        textDirection: TextDirection.ltr,
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      '${trading}%',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                          color: trading > 0
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: SizedBox(
                                      width: 10.w,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                  ],
                ),
            ],
          ),
          );
        },
      ),
    );
  }
}
