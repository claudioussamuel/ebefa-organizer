import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../controller/date_and_time_controllers.dart';
import '../controller/home_controller.dart';
import '../controller/product_controller.dart';
import '../controller/users_bought_controller.dart';

const kPrimaryColor = Color(0xFF241c1c);
const kPrimaryLightColor = Color(0xFFebdbd3);
AuthController authController = AuthController.instance;
ticketController tickController = ticketController.instance;
UsersBoughtController usersBoughtController = UsersBoughtController.instance;
HomeController homeController = HomeController.instance;
DateController controller = DateController.instance;
