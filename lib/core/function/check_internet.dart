import 'dart:io';
import 'package:http/http.dart' as http;

Future<bool> hasNetwork() async {
  try {
    final result = await http.get(Uri.parse('www.google.com'));
    if (result.statusCode == 200) {
      print('${result.statusCode}[[[[[[[[]]]]]]]]');
      return true;
    } else {
      print(result.statusCode);

      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
}
