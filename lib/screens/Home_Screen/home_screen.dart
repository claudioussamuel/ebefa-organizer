import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../DashBoard/editEvent/edit_event.dart';
import '../Terms_and_con/terms_and_condition.dart';
import '../contact/contact_us.dart';
import 'ticket_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organizer'),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      // body:

      //  Container(
      //   color: Colors.white30,
      //   child: const TicketWidget(),
      // ),
      body: Obx(
        () => homeController.connectionStatus.value == 1
            ? Container(
                color: Colors.white30,
                child: const TicketWidget(),
              )
            : Container(
                color: kPrimaryLightColor,
                child: Center(
                  child: Text('No Internet',
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold)),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => EditEvent(),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(() => UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                ),
                accountName: Text(
                  authController.adminModel.value.name ?? "",
                  style: TextStyle(color: kPrimaryLightColor),
                ),
                accountEmail: Text(
                  authController.adminModel.value.email ?? "",
                  style: TextStyle(color: kPrimaryLightColor),
                ))),
            ListTile(
              onTap: () {
                Get.to(() => ContactUs());
              },
              leading: Icon(Icons.help),
              title: Text(
                "Contact us",
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(() => TermsAndConditions());
              },
              leading: Icon(Icons.article_outlined),
              title: Text("Terms And Conditions"),
            ),
            ListTile(
              onTap: () {
                Get.to(() => ContactUs());
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
