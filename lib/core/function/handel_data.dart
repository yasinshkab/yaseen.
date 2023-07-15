import 'package:hommer_admin/core/status_request.dart';

handelData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.sucess;
  }
}
