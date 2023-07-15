class ServiceModel {
  String? serviceId;
  String? serviceUser;
  String? serviceName;
  String? serviceCategory;
  String? serviceType;
  String? serviceDevice;
  String? serviceRegion;
  String? serviceUsernumber;
  String? serviceTime;
  String? serviceStatus;

  ServiceModel(
      {this.serviceId,
      this.serviceUser,
      this.serviceName,
      this.serviceCategory,
      this.serviceType,
      this.serviceDevice,
      this.serviceRegion,
      this.serviceUsernumber,
      this.serviceTime,
      this.serviceStatus});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceUser = json['service_user'];
    serviceName = json['service_name'];
    serviceCategory = json['service_category'];
    serviceType = json['service_type'];
    serviceDevice = json['service_device'];
    serviceRegion = json['service_region'];
    serviceUsernumber = json['service_usernumber'];
    serviceTime = json['service_time'];
    serviceStatus = json['service_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_user'] = serviceUser;
    data['service_name'] = serviceName;
    data['service_category'] = serviceCategory;
    data['service_type'] = serviceType;
    data['service_device'] = serviceDevice;
    data['service_region'] = serviceRegion;
    data['service_usernumber'] = serviceUsernumber;
    data['service_time'] = serviceTime;
    data['service_status'] = serviceStatus;
    return data;
  }
}
