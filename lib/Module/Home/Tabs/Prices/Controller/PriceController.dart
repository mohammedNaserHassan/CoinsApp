import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../Constants.dart';
import '../../../../../Helper/DioHelper.dart';
import '../../../../../Model/Tcurrency.dart';

class PriceController extends GetxController{
  @override
  void onInit() {
    trigerScrollDown();
    getCurunceies();
  }

  var itemController = ItemScrollController();
  List<Tcurrency> curencces = [];
  int page_number = 1;

  refreshCurrency() {
    page_number = 1;
    curencces.clear();
    getCurunceies();
    update();
  }

  //////// get All Currency//////////////
  getCurunceies() async {
    var response = await DioHelper.helper
        .getRequest(
        urlCurrency, map: {"i_page_count": 20, "i_page_number": page_number});
    List<dynamic> results = response.data['currencies'];
    curencces = results.map((e) => Tcurrency.fromJson(e)).toList();
    update();
  }
  ScrollController scrollController = ScrollController();

  trigerScrollDown() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        loadMore();
      }
    });
  }

  ///Load more currency /////////
  loadMore() async {
    if (page_number < 20) {
      page_number++;
      var response = await DioHelper.helper.getRequest(urlCurrency,
          map: {"i_page_count": 20, "i_page_number": page_number});
      List<dynamic> more = response.data['currencies'];
      curencces.addAll(more.map((e) => Tcurrency.fromJson(e)).toList());
      update();
    }
    return;
  }

////////////////////////////////////////////////////////////////////////////////////////////////////
}