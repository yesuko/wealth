import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class HubtelPayment {
 static Future<String> makePayment(
      String source, double amount) async {
//     var client = http.Client();
//     var username = "qledthjj";
//     var password = "ykdhnthp";
//     var bytes = utf8.encode('<$username>:<$password>');
//     var base64String = base64.encode(bytes);
//     var headers = {'Authorization': 'Basic $base64String'};
//     // gwt logo from asset
//     var logoAssetPath = 'assets/images/launch_icon.png';
//     var logoData = await rootBundle.load(logoAssetPath);
//     var logoBytes = logoData.buffer.asUint8List();
//     var logoBase64 = base64Encode(logoBytes);
//     var json = {
//       'amount': amount,
//       'title': 'Add Funds',
//       'description': 'This amount added to your $source income source',
//       'clientReference': 'string',
//       'callbackUrl': 'http://example.com',
//       'cancellationUrl': 'http://example.com',
//       'returnUrl': 'http://example.com',
//       'logo': 'data:image/png;base64,$logoBase64'
//     };
//     var postData = jsonEncode(json);
//     var mobileNumber = '233559904540';
//     var response = await client.post(
//         Uri.parse(
//             'https://devp-reqsendmoney-230622-api.hubtel.com/request-money/$mobileNumber'),
//         body: postData,
//         headers: headers);

// //         You will be required to enter your MTN Mobile Money PIN to authorise this payment.

// // If you don’t receive any authorisation prompt, dial *170#, go to My Account and select Approvals .
//     print(response.body);
//     client.close();

    var username = 'qledthjj';
    var password = 'ykdhnthp';
    var mobileNumber = '233559904540';

    var client = http.Client();
    var basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
    var uri = Uri.parse(
        'https://devp-reqsendmoney-230622-api.hubtel.com/request-money/$mobileNumber');

    try {
      var logoAssetPath = 'assets/images/launch_icon.png';
      var logoData = await rootBundle.load(logoAssetPath);
      var logoBytes = logoData.buffer.asUint8List();
      var logoBase64 = base64Encode(logoBytes);

      var json = jsonEncode({
        'amount': amount,
        'title': 'Transfare Funds',
        'description': 'his amount added to your $source income source',
        'clientReference': DateTime.now().toString(),
        'callbackUrl': 'http://example.com',
        'cancellationUrl': 'http://example.com',
        'returnUrl': 'http://example.com',
        'logo': 'data:image/png;base64,$logoBase64',
      });

      var response = await client.post(
        uri,
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: json,
      );

      return (response.body);
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }
}
