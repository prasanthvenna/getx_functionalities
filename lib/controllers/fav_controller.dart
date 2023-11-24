

import 'package:get/get.dart';

class FavouriteItems extends GetxController{

  RxList <String> sports=['cricket', 'football', 'chess', 'basketball', 'badminton'].obs; //Avaliable List
  RxList favList =[].obs;
  
  addToFavourite(String value){
    favList.add(value);
  }

  removeFromFavorite(String value){
    favList.remove(value);
  }
}