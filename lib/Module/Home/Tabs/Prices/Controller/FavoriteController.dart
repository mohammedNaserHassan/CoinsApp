
import 'package:get/get.dart';

import '../../../../../Constants.dart';
import '../../../../../Helper/DioHelper.dart';
import '../../../../../Model/Tcurrency.dart';

class FavoriteController extends GetxController{
  @override
  void onInit() {
    getAllFavorite();
  }

  //// add to Favorites ////////////////
  Tcurrency selectedFavorite = Tcurrency();

  addFavorite(Tcurrency tcurrency) async {
    if (favoriteItems.length <4) {
      selectedFavorite = tcurrency;
      await DioHelper.helper.postRequest(addFavorites, {
        's_currency': selectedFavorite.sCode,
      });
      getAllFavorite();
    }
    else Get.snackbar('', 'لقد تخطيت الحد الأقصى بالمفضلة');
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////

  //// get all Favorites ////////////////
 Tcurrency defultFavorite =  Tcurrency(sName: 'اضغط للاضافة',pkIId: 0, sIcon: 'https://images.pexels.com/photos/7245527/pexels-photo-7245527.jpeg?auto=compress&cs=tinysrgb&w=600');
  List<Tcurrency> favoriteItems = [];

  getAllFavorite() async {
    var response = await DioHelper.helper.getRequest(favorites, map: {
      "i_page_count": 6,
      "i_page_number": 1
    });
    List<dynamic> favoriteList = response.data['favourites'];
    favoriteItems.clear();
    favoriteItems =favoriteList.map((e) => Tcurrency.fromJson(e)).toList();
 if( favoriteItems.length<4)   favoriteItems.add(defultFavorite);
    update();
  }

}