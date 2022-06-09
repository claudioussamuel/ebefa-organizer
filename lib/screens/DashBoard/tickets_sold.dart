import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class TicketsSold extends StatelessWidget {
  const TicketsSold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendants'),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: usersBoughtController.userswhoboughttickes.length,
          itemBuilder: (context, index) =>
              // Container(
              //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              //       margin: EdgeInsets.only(bottom: 16),
              //       decoration: BoxDecoration(
              //           gradient: LinearGradient(
              //               colors: [Color(0xFF6448FE), Color(0xFF5FC6FF)],
              //               begin: Alignment.centerLeft,
              //               end: Alignment.centerRight),
              //           borderRadius: BorderRadius.all(Radius.circular(24))),
              //       child: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Text(
              //                 usersBoughtController
              //                         .userswhoboughttickes[index].name ??
              //                     '',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontFamily: 'avenir',
              //                     fontSize: 24),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                 usersBoughtController
              //                         .userswhoboughttickes[index].email ??
              //                     '',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontFamily: 'avenir',
              //                     fontSize: 16),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             children: [
              //               Text(
              //                 usersBoughtController
              //                         .userswhoboughttickes[index].id ??
              //                     '',
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontFamily: 'avenir',
              //                     fontSize: 24),
              //               ),
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              Card(
            child: ListTile(
              title: Text(
                  usersBoughtController.userswhoboughttickes[index].name ?? ''),
              subtitle: Text(
                  usersBoughtController.userswhoboughttickes[index].email ??
                      ''),
            ),
          ),
        ),
      ),
    );
  }
}
