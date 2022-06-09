import 'package:date_format/date_format.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../constants/firebase.dart';
import '../../../methods/show_loading.dart';
import '../../../models/tickect.dart';
import '../../Home_Screen/home_screen.dart';

class AdminInfo extends StatefulWidget {
  const AdminInfo({Key? key}) : super(key: key);

  @override
  _AdminInfoState createState() => _AdminInfoState();
}

class _AdminInfoState extends State<AdminInfo> {
  UploadTask? task;
  String? url;
  // DateController controller = DateController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ticket Info'),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          // color: Colors.white,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: MaterialButton(
                    //==== for buying from paystack =====
                    onPressed: () async {
                      showLoading();

                      if (tickController.eventName.text.trim().isEmpty ||
                          tickController.eventLocation.text.trim().isEmpty) {
                        Get.snackbar(
                          'Fill column',
                          'Try again',
                          // snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        task = tickController.uploadFile();
                        if (task == null) return;

                        final snapshot = await task!.whenComplete(() {});
                        final urlDownload = await snapshot.ref.getDownloadURL();
                        url = urlDownload;

                        print(
                            'Account Number is ${tickController.sendAccountNumber}');
                        tickController.addTicket(
                            // add to the admin
                            TickectModel(
                          id: tickController.eventName.text.trim(),
                          location: tickController.eventLocation.text.trim(),
                          city: tickController.eventCity.text.trim(),
                          description: tickController.eventAbout.text.trim(),
                          name: tickController.eventName.text.trim(),
                          price: double.parse(
                              tickController.tickectPrice.text.trim()),
                          startTime: controller.selectedStartTime.value
                              .format(context),
                          endTime:
                              controller.selectedEndTime.value.format(context),
                          picture: url,
                          subAccountNumber:
                              tickController.sendAccountNumber.value,
                          date: formatDate(
                              controller.selectedDate.value, [M, ',', d]),
                          adminId: auth.currentUser?.uid,
                          path: tickController.getString(),
                        ));

                        // add to the user
                        tickController
                            .addAllTicket(
                              TickectModel(
                                id: tickController.eventName.text.trim(),
                                location:
                                    tickController.eventLocation.text.trim(),
                                city: tickController.eventCity.text.trim(),
                                description:
                                    tickController.eventAbout.text.trim(),
                                name: tickController.eventName.text.trim(),
                                price: double.parse(
                                    tickController.tickectPrice.text.trim()),
                                startTime: controller.selectedStartTime.value
                                    .format(context),
                                endTime: controller.selectedEndTime.value
                                    .format(context),
                                picture: url,
                                subAccountNumber:
                                    tickController.sendAccountNumber.value,
                                date: formatDate(
                                    controller.selectedDate.value, [M, ',', d]),
                                adminId: auth.currentUser?.uid,
                                path: tickController.getString(),
                              ),
                            )
                            .whenComplete(() => Get.offAll(() => MyHomePage()));
                      }
                    },

                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      'Submit'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Pick Image'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: InkWell(
                  child: Container(
                    width: 190,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                      color: kPrimaryColor,
                      image: tickController.file != null
                          ? DecorationImage(
                              image: FileImage(tickController.file!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage('null'),
                            ),
                    ),
                  ),
                  onTap: () {
                    // select pick
                    tickController.getImage();
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Phone Number'),
                  ),
                ],
              ),
              TextfieldContainer(
                size: size,
                child: TextField(
                  controller: tickController.phoneNumber,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Ticket Price'),
                  ),
                ],
              ),
              TextfieldContainer(
                size: size,
                child: TextField(
                  controller: tickController.tickectPrice,
                  decoration: InputDecoration(
                    hintText: 'Price of Ticket',
                    prefixText: "₵",
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(),
            ]),
      ),
    );
  }
}

class TextfieldContainer extends StatelessWidget {
  final Widget child;
  const TextfieldContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: size.width * 0.8,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(29),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
