import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:coins_app/Module/Home/Tabs/Prices/Controller/FavoriteController.dart';
import 'package:coins_app/Module/Home/Tabs/Prices/Controller/PriceController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SelectionPage extends StatelessWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'قائمة  العملات الالكترونية',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: GetBuilder<PriceController>(
          init: PriceController(),
          builder: (getx) {
            return  SingleChildScrollView(
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      color: Color(0xffF8F9FB),
                      height: 41.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'العملة',
                            style: TextStyle(fontSize: 9, color: Colors.grey),
                          ),
                          Text('السعر',
                              style: TextStyle(fontSize: 9, color: Colors.grey)),
                          Text('التداول',
                              style: TextStyle(fontSize: 9, color: Colors.grey)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                getx.curencces.isEmpty?CircularProgressIndicator():    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            Divider(
                              color: Colors.grey,
                              height: 40.h,
                            ),
                        shrinkWrap: true,
                        itemCount: getx.curencces.length,
                        itemBuilder: (context, index) {
                          final priceItem = getx.curencces[index];
                          return GetBuilder<FavoriteController>(
                              init: FavoriteController(),
                              builder: (getx) {
                                return GestureDetector(
                                  onTap: () {
                                    getx.addFavorite(priceItem);
                                    Get.back();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text('${index + 1}'),
                                   Container(
                                     width: 50.w,
                                     height: 50.h,
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                         image: NetworkImage(priceItem.sIcon??''),
                                         fit: BoxFit.fill
                                       )
                                     ),
                                   ),
                                      Flexible(child: Text(priceItem.sName??'',overflow: TextOverflow.ellipsis,)),
                                      Text(priceItem.dValue??'',overflow: TextOverflow.ellipsis,),
                                      Text('${priceItem.pkIId??''}  \$ '),
                                      Text(
                                        '${priceItem.dTrading??''}%',
                                        style: TextStyle(
                                           color: Colors.green),
                                      )
                                    ],
                                  ),
                                );
                              }
                          );
                        })
                  ],

              ),
            );
          },
        ),
      ),
    );
  }
}
