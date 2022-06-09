import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';
import '../../controller/users_bought_controller.dart';
import '../../models/tickect.dart';
import '../Home_Screen/home_screen.dart';
import 'tickets_sold.dart';

class Dash extends StatelessWidget {
  final TickectModel ticket;
  const Dash({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UsersBoughtController usersBoughtController =
        Get.put(UsersBoughtController(), permanent: false);
    usersBoughtController.getTicketModel(ticket);
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(.0),
                  child: ElevatedButton(
                    onPressed: () {
                      tickController.removeImageFromFirebaseStorage(ticket);
                      tickController.removeTickectsUser(ticket);
                      tickController.removeTickectsAdmin(ticket);

                      Get.off(() => MyHomePage());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.width * 0.2),
                      primary: kPrimaryColor,
                      onPrimary: kPrimaryLightColor,
                    ),
                    child: Text('Delete Event'),
                  )
                  /*
                 InkWell(
                  child: CircleAvatar(
                    maxRadius: 80,
                    backgroundColor: kPrimaryLightColor,
                    foregroundColor: kPrimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Delete Event')
                      ],
                    ),
                  ),
                  onTap: () {
                    tickController.removeImageFromFirebaseStorage(ticket);
                    tickController.removeTickectsUser(ticket);
                    tickController.removeTickectsAdmin(ticket);

                    Get.off(() => MyHomePage());
                  },
                 ),*/
                  ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const TicketsSold());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      onPrimary: kPrimaryLightColor,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.width * 0.2),
                    ),
                    child: Text('Attendants'),
                  )

                  //InkWell(
                  //     child: CircleAvatar(
                  //       maxRadius: 80,
                  //       backgroundColor: kPrimaryLightColor,
                  //       foregroundColor: kPrimaryColor,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Icon(Icons.add),
                  //           SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text('Attendants'),
                  //         ],
                  //       ),
                  //     ),
                  //     onTap: () {
                  //       Get.to(() => const TicketsSold());
                  //     }),
                  ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: CircleAvatar(
          //         maxRadius: 80,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.add),
          //             SizedBox(
          //               height: 10,
          //             ),
          //             Text('Refund')
          //           ],
          //         ),
          //       ),
          //     ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(
          //     maxRadius: 80,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Icon(Icons.add),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text('Terms and'),
          //         Text('Conditions')
          //       ],
          //     ),
          //   ),
          // ),
          //],
          // )
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //     elevation: 0,
      //     // color: Colors.white,
      //     child: Container(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           SizedBox(
      //             height: size.height * 0.07,
      //             width: size.width * 0.8,
      //             child: MaterialButton(
      //               //==== for buying from paystack =====
      //               onPressed: () {},

      //               color: Colors.blue,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(29),
      //               ),
      //               child: Text(
      //                 'Withdraw'.toUpperCase(),
      //                 style: TextStyle(
      //                   fontSize: 17,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.white,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     )),
    );
  }
}
