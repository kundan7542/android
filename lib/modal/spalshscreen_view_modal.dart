import 'package:shopping/login_screen_view.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class SpalshscreenViewModal extends BaseViewModel
{
   Future<void> spalshscreen() async{
     await Future.delayed(Duration(seconds: 5));
     Get.to(LoginScreenView());
     // print('Home Screen');
     notifyListeners();
   }
}