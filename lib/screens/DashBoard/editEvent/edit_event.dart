import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organizer/screens/DashBoard/bank_details/bank.dart';
import '../../../constants/constants.dart';
import 'admin_info.dart';

class EditEvent extends StatefulWidget {
  const EditEvent({Key? key}) : super(key: key);

  @override
  _EditEventState createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
  // DateController controller = DateController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Info'),
        centerTitle: true,
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        foregroundColor: kPrimaryColor,
        child: Icon(
          Icons.arrow_forward_ios_outlined,
        ),
        onPressed: () {
          if (tickController.eventName.text.trim().isEmpty ||
              tickController.eventLocation.text.trim().isEmpty ||
              tickController.eventCity.text.trim().isEmpty ||
              tickController.eventAbout.text.trim().isEmpty) {
            Get.snackbar(
              'Fill column',
              'Try again',
              // snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            Get.to(() => BankDetails());
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Enter Name'),
                  ),
                ],
              ),
              TextfieldContainer(
                size: size,
                child: TextField(
                  controller: tickController.eventName,
                  decoration: InputDecoration(
                    hintText: 'Event Name',
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Enter Location'),
                  ),
                ],
              ),
              TextfieldContainer(
                size: size,
                child: TextField(
                  controller: tickController.eventLocation,
                  decoration: InputDecoration(
                    hintText: 'Event Location',
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Enter City Name'),
                  ),
                ],
              ),
              TextfieldContainer(
                size: size,
                child: TextField(
                  controller: tickController.eventCity,
                  decoration: InputDecoration(
                    hintText: 'City of the location',
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Event Descrption'),
                  ),
                ],
              ),
              TextfieldContainerAbout(
                size: size,
                child: TextField(
                  minLines: 1,
                  maxLines: 50,
                  controller: tickController.eventAbout,
                  decoration: InputDecoration(
                    hintText: 'About the Event',
                    fillColor: Colors.black,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Event Date :'),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.chooseDate();
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() => Text(formatDate(
                        controller.selectedDate.value, [M, ',', d]))),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Start Time :'),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.chooseStartTime();
                    },
                    icon: Icon(Icons.alarm),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => Text(
                        controller.selectedStartTime.value.format(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('End   Time :'),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.chooseEndTime();
                    },
                    icon: Icon(Icons.alarm),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                      () => Text(
                        controller.selectedEndTime.value.format(context),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
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

class TextfieldContainerAbout extends StatelessWidget {
  final Widget child;
  const TextfieldContainerAbout({
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
      height: size.height * 0.5,
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
