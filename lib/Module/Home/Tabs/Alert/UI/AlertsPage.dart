import 'package:coins_app/Module/Home/Tabs/Alert/AlertController.dart';
import 'package:coins_app/Module/Home/MainHome/CoinsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'DialogPage.dart';


class AlertsPage extends StatelessWidget {
  const AlertsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'منبه العملات',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'يرجى اختيـار نوع العملة ',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      body: GetBuilder<AlertController>(
        init: AlertController(),
  builder: (getx) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.to(DialogPage());
              },
              child: Container(
                width: 345.w,
                height: 56.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: ListTile(
                  leading: Image.network(getx.selectedCurrency.sIcon??'',fit: BoxFit.scaleDown,),
                  title:  Text(' ${getx.selectedCurrency.sName}'),
                  trailing: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.only(start: 10.w),
              child: Text(
                'يرجى تحديد قيمة المنبه',
                style: TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              width: 345.w,
              height: 56.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<int>(
                      onChanged: (value) {
                        getx.setValueGroup(value??1);
                      },
                      value: getx.valueDrop,
                      underline: Container(
                        color: Colors.white,
                      ),
                      items: const[
                        DropdownMenuItem(
                          child: Text('اكبر من '),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text('اصغر من '),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(' يساوي '),
                          value: 3,
                        ),
                      ]),
                  VerticalDivider(
                    color: Colors.grey,
                  ),
                  Center(child: Text(
                    '\$10,000', style: TextStyle(fontSize: 18.sp),)),
                ],
              ),
            ),
            GestureDetector(
              onTap: getx.addToAlerts,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                width: 345.w,
                height: 55.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        colors: [
                          Color(0xffFFDB00),
                          Color(0xffFFA500),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(0.5, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp)),
                child: Center(
                  child: Text(
                    'اضـــافة تنبيه',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
        getx.alerts.length==0?Center(child: CircularProgressIndicator()) : ListView.builder(
          shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: getx.alerts.length,
              itemBuilder: (con,index){
              final fav = getx.alerts[index];
              return   Container(
                width: 345.w,
                height: 66.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ListTile(
                  leading: Image.network(fav.sIcon??''),
                  title: Text(
                   fav.sName??'' ,
                    style: TextStyle(
                      fontSize: 11,

                    ),
                  ),
                  subtitle: Text('يسـاوي     ${fav.dValue} \$',
                    style: TextStyle(color: Colors.green),),
                  trailing: IconButton(
                    onPressed: (){
                      getx.removeAlert(fav.pkIId??0);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.green,
                    ),
                  ),
                ),
              );}
          )
          ],
        ),
    );
  },
),
    );
  }
}
