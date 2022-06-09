import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/firebase.dart';
import 'controller/auth_controller.dart';
import 'controller/date_and_time_controllers.dart';
import 'controller/home_controller.dart';
import 'controller/product_controller.dart';
import 'screens/Home_Screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialization.then((value) {
    Get.put(AuthController());
    Get.put(ticketController());
    Get.put(HomeController());
    Get.put(DateController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
