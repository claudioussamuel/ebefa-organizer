import 'dart:io';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: kPrimaryColor,
              height: size.height * 0.3,
              width: size.width,
              child: Image.asset(
                'assets/images/3b3fa.png',
              ),
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''
                    What good is an event, a program or a service if no one knows where it is ? 
                  3b3fa is an event booking, ticket buying and selling app. 3b3fa stands to defy all odds in the ticket and event business.
                  It is easy to use, fast and very convinient.No matter where the event is located 3b3fa got you covered. 3b3fa, Your ticket is a click away.
                    ''',
                style: TextStyle(fontSize: 18, color: kPrimaryLightColor),
              ),
            ),
            Divider(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.phone,
                    color: kPrimaryLightColor,
                  ),
                ),
                // ======= The Price of the ticket =====
                Text(
                  "050 0971 674",
                  style: TextStyle(fontSize: 18, color: kPrimaryLightColor),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.email,
                    color: kPrimaryLightColor,
                  ),
                ),
                // ======= The Price of the ticket =====
                Text(
                  "3b3faapp@gmail.com",
                  style: TextStyle(fontSize: 18, color: kPrimaryLightColor),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'IG : ',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
                Text(
                  "3b3faapp",
                  style: TextStyle(fontSize: 18, color: kPrimaryLightColor),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'TWITTER : ',
                    style: TextStyle(
                      color: kPrimaryLightColor,
                    ),
                  ),
                ),
                Text(
                  "3b3fa10",
                  style: TextStyle(fontSize: 18, color: kPrimaryLightColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
