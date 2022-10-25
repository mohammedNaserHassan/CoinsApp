import 'package:get/get.dart';

import '../../../../Constants.dart';
import '../../../../Helper/DioHelper.dart';
import '../../../../Model/Tnews.dart';

class NewsController extends GetxController{
  @override
  void onInit() {
    getNews();
  }
  setLength(){
    getNews();
    newsLength=news.length;
    update();
  }
  List<Tnews> news = [];
  int newsLength =5;

  getNews() async {
    var response = await DioHelper.helper.getRequest(urlNews);
    List<dynamic> results = response.data['news'];
    news = results.map((e) => Tnews.fromJson(e)).toList();
    update();
  }

  bool isDetails = false;
  int index = 0;

  setDetails({int? index}) {
    this.isDetails = !this.isDetails;
    this.index = index ?? 0;
    update();
  }
}