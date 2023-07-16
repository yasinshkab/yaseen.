class TypeModel {
  String? typeId;
  String? typeName;
  String? typeImage;
  String? typeCategory;

  TypeModel({this.typeId, this.typeName, this.typeImage, this.typeCategory});

  TypeModel.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    typeName = json['type_name'];
    typeImage = json['type_image'];
    typeCategory = json['type_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_id'] = typeId;
    data['type_name'] = typeName;
    data['type_image'] = typeImage;
    data['type_category'] = typeCategory;
    return data;
  }
}
