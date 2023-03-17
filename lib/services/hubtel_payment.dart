import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';

class HubtelPayment {
  static Future<Map<Uri, Response>> makePayment(
      String source, double amount) async {
    var username = 'qledthjj';
    var password = 'ykdhnthp';
    var mobileNumber = '233559904540';

    var client = Client();
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
        'description': 'This amount added to your $source income source',
        'clientReference': DateTime.now().toString(),
        'callbackUrl': 'http://example.com',
        'cancellationUrl': 'http://example.com',
        'returnUrl': 'http://example.com',
        'logo': 'data:image/png;base64,$logoBase64',
      });

      Response response = await client.post(
        uri,
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: json,
      );
      print("im here");
      print(response.statusCode);

      return {uri: response};
    } catch (e) {
      rethrow;
    } finally {
      client.close();
    }
  }
}
