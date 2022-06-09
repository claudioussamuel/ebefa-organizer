import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants/constants.dart';

// this code create a subaccount in paystack

subAccountDetails() async {
  var headers = {
    'Authorization': 'Bearer sk_test_c92466e2d1031748ab44f1995df0a57e504f5221',
    'Content-Type': 'application/json'
  };
  var request =
      http.Request('POST', Uri.parse('https://api.paystack.co/subaccount'));
  request.body = json.encode({
    "business_name": tickController.accountName.text.trim(),
    "settlement_bank": tickController.selectedBank.value,
    "account_number": tickController.accountNumber.text.trim(),
    "percentage_charge": 3,
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  // print("response status ${response.statusCode}");

  Map<String, dynamic> data;
  if (response.statusCode == 201) {
    //print(await response.stream.bytesToString());
    data = json.decode(await response.stream.bytesToString());
    tickController.sendAccountNumber.value = data['data']['subaccount_code'];
  } else {
    print(response.reasonPhrase);
  }
}
