import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hommer_admin/core/status_request.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'check_internet.dart';

Future<Either<StatusRequest, Map>> postDataWithImage(
    String urllink, Map data, PlatformFile file) async {
  if (await hasNetwork()) {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(urllink),
    );
    var multipartfile = http.MultipartFile.fromBytes(
      "files",
      file.bytes!,
      filename: file.name,
      contentType: MediaType('image',
          'png'), // Change 'jpeg' to the type of image you are uploading
    );
    //////////
    request.files.add(multipartfile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var therequest = await request.send();
    var response = await http.Response.fromStream(therequest);
    print(therequest.statusCode);
    print('////////////////////////////////////////');
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
