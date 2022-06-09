import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/constants.dart';
import '../../../methods/sub_account_details.dart';
import '../editEvent/admin_info.dart';

class BankDetails extends StatefulWidget {
  const BankDetails({Key? key}) : super(key: key);

  @override
  State<BankDetails> createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  List<String> bankName = [
    'Absa Bank Ghana Ltd',
    'Access Bank',
    'ADB Bank Limited',
    'AirtelTigo',
    'ARB Apex Bank',
    'Bank of Africa Ghana',
    'Bank of Baroda Ghana Limited',
    'Bank of Ghana',
    'Barclays Bank of Ghana Limited',
    'BSIC Ghana Limited',
    'CAL Bank Limited',
    'Consolidated Bank Ghana Limited',
    'Ecobank Ghana Limited',
    'Energy Bank Ghana Limited',
    'FBNBank Ghana Limited',
    'Fidelity Bank Ghana Limited',
    'First Atlantic Bank Ghana Limited',
    'First National Bank Ghana Limited',
    'GCB Bank Limited',
    'GHL Bank',
    'Gn Bank',
    'Guaranty Trust Bank (Ghana) Limited',
    'Heritage Bank Ghana',
    'HFC Bank Ghana Limited',
    'MTN',
    'National Investment Bank Limited',
    'OmniBank Ghana Limited',
    'Premium Bank Limited',
    'Prudebtial Bank Limited',
    'Services Integrity Savings and Loans',
    'Sovereign Bank Ghana',
    'Stanbic Bank Ghana Limited',
    'Standard Chartered Bank Limited',
    'The Royal Bank Limited',
    'UniBank Ghana Limited',
    'United Bank for Africa Ghana Limited',
    'Universal Merchant Bank Ghana Limited',
    'Vodafone',
    'Zenith Bank Ghana',
  ];

  //String? selectedBank = 'Absa Bank Ghana Ltd';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
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
        // work here
        onPressed: () async {
          if (tickController.accountName.text.trim().isEmpty ||
              tickController.accountNumber.text.trim().isEmpty) {
            Get.snackbar(
              'Fill column',
              'Try again',
              // snackPosition: SnackPosition.BOTTOM,
            );
          } else {
            subAccountDetails();
            Get.to(() => AdminInfo());
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
                  child: Text('Bank Name'),
                ),
              ],
            ),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  // width: size.width * 0.8,
                  padding: EdgeInsets.all(8),
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: DropdownButton(
                      value: tickController.selectedBank.value,
                      items: bankName
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  e,
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (String? e) =>
                          tickController.selectedBank.value = e ?? 'MTN'),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Account Name'),
                ),
              ],
            ),
            TextfieldContainer(
              size: size,
              child: TextField(
                controller: tickController.accountName,
                decoration: InputDecoration(
                  hintText: 'Account Name',
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
                  child: Text('Account Number'),
                ),
              ],
            ),
            TextfieldContainer(
              size: size,
              child: TextField(
                controller: tickController.accountNumber,
                decoration: InputDecoration(
                  hintText: 'Account Number',
                  fillColor: Colors.black,
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
          ],
        ),
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
