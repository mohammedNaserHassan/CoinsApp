import 'package:get/get.dart';

import '../../../../Constants.dart';
import '../../../../Helper/DioHelper.dart';
import '../../../../Model/TAlert.dart';
import '../../../../Model/Tcurrency.dart';

class AlertController extends GetxController{
  @override
  void onInit() {
    getAlerts();
  }

  int valueDrop = 1;

  setValueGroup(int val) {
    this.valueDrop = val;
    update();
  }

  //// Get Alerts ////////////
  List<TAlert> alerts = [];

  getAlerts() async {
    var response = await DioHelper.helper.getRequest(alertList);
    List<dynamic> mylist = response.data['condition'];
    alerts = mylist.map((element) => TAlert.fromJson(element)).toList();
    update();
  }

///////////////////////////////////////
  Tcurrency selectedCurrency = Tcurrency(
      sIcon: 'https://images.unsplash.com/photo-1519162584292-56dfc9eb5db4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Yml0Y29pbiUyMGljb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      sName: 'BitCoin');
  //// Add Alert /////////////
  addToAlerts() async {
    if (selectedCurrency.dTrading != null) {
      var response = await DioHelper.helper.postRequest(addAlert, {
        's_code': selectedCurrency.sCode,
        'i_type': valueDrop,
        'd_value': selectedCurrency.dValue
      });
      Get.snackbar('', response.data['status']['message'],
          snackPosition: SnackPosition.BOTTOM);
      getAlerts();
    }
    else {
      Get.snackbar('', 'يرجى اختيار عملة', snackPosition: SnackPosition.BOTTOM);
      return;
    }
  }

  //////////////////////////////////////////////
  setAlertText({required Tcurrency tcurrency}) {
    this.selectedCurrency = tcurrency;
    update();
  }
  //////// Remove alert /////////
  removeAlert(int id) async {
    var response = await DioHelper.helper.deleteRequest(deleteAlert + '${id}');
    Get.snackbar('', response.data['status']['message'],
        snackPosition: SnackPosition.BOTTOM);
    getAlerts();
  }

///////////////////////////////////////////////////////////////////////////////////////////////////
}