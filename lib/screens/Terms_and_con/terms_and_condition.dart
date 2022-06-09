import 'package:flutter/material.dart';
import 'package:organizer/constants/constants.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        height: size.height,
        width: size.width,
        child: Container(
          width: size.width,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.035),
          child: Column(
            children: [
              SizedBox(
                height: size.width * 0.04,
              ),
              Row(
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: size.height * 0.075,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Terms of Service',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          'Last Updated: June 15, 2022',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: size.height * 0.0175,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.04,
              ),
              Text(
                'Three percent (3%) fee is charged on any tickect bought through our app.\n '
                'The money gets into your account in with 24 hours of payment',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
