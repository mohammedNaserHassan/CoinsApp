import 'package:coins_app/Module/Home/Tabs/Alert/AlertController.dart';
import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:coins_app/Module/Home/Tabs/Prices/Controller/PriceController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

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
        body: SingleChildScrollView(
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
                height: 10,
              ),
              GetBuilder<PriceController>(
                init: PriceController(),
                builder: (getx) {
                  return ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                            color: Colors.grey,
                            height: 40.h,
                          ),
                      shrinkWrap: true,
                      itemCount: getx.curencces.length,
                      itemBuilder: (context, index) {
                        final priceItem = getx.curencces[index];
                        return GetBuilder<AlertController>(
                            init: AlertController(),
                            builder: (alert) {
                              return GestureDetector(
                                onTap: () {
                                  alert.setAlertText(
                                      tcurrency: getx.curencces[index]);
                                  Get.back();
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${index + 1}'),
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(priceItem.sIcon ?? ''),
                                    ),
                                    Text(priceItem.sName ?? ''),
                                    Text(priceItem.sCode ?? ''),
                                    Text('${priceItem.dTrading}  \$ '),
                                    Text(
                                      '${priceItem.dTrading}%',
                                      style: TextStyle(color: Colors.green),
                                    )
                                  ],
                                ),
                              );
                            });
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
