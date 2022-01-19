import 'dart:convert';
import 'package:apilive/apidata3.dart';
import 'package:dio/dio.dart';

Future<ApiFindByPinData> getHttp(int pincode, String date) async {
  try {
    var response = await Dio().get(
      'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin',
      queryParameters: {
        "pincode": "$pincode",
        "date": "$date",
      },
    );
    if (response.statusCode == 200) {
      var temp = apiFindByPinDataFromJson(json.encode(response.data));
      print(temp);
      return temp;
    }
    return ApiFindByPinData();
  } catch (e) {
    print(e);
    return ApiFindByPinData();
  }
}
