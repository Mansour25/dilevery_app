import 'package:dilevery_app/core/constant/constant_data.dart';
import 'package:dilevery_app/core/constant/route_page.dart';
import 'package:dilevery_app/core/functions/printing.dart';
import 'package:dilevery_app/core/services/shared_pred.dart';
import 'package:dilevery_app/view/screens/auth/sign_in_screen.dart';
import 'package:dilevery_app/view/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Shared_pref().init_shared_pref();

  String email =
      Shared_pref.sharedPreferences!.getString('delivery_email') ?? 'null';

  delivery_id = Shared_pref.sharedPreferences!.getString('delivery_id') ?? '' ;

  Widget FirstScreen = SigInScreen();



  if (email != 'null') {
    FirstScreen = HomeScreen();
  }

  runApp(DeliveryApp(FirstScreen));
}

class DeliveryApp extends StatelessWidget {
  Widget FirstScreen;

  DeliveryApp(this.FirstScreen);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: AppRoute,
      debugShowCheckedModeBanner: false,
      home: FirstScreen,
    );
  }
}
