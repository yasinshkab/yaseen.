import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:hommer_admin/core/function/check_internet.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String urllink, Map data) async {
    if (await hasNetwork()) {
      var response = await http.post(Uri.parse(urllink), body: data);
      print(response.statusCode);
      print('//////////////////');
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.noInternet);
    }
  }
}
