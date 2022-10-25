import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../Tabs/Alert/UI/AlertsPage.dart';
import '../Tabs/News/Ui/NewsPage.dart';
import '../Tabs/Prices/Ui/PricesPage.dart';

class CoinsController extends GetxController {
  int pageIndex = 0;
  final pages = [
    const PricesPage(),
    const AlertsPage(),
    const NewsPage(),
  ];
  setPageIndex(int pageIndex) {
    this.pageIndex = pageIndex;
    update();
  }
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////



}
