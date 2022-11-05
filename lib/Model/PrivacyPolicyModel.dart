/// success : true
/// data : [{"id":1,"description":"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without","is_deleted":false,"created_by":"test","created_at":"2022-09-22T06:23:32.859723Z","updated_at":"2022-09-22T06:23:32.859723Z"}]
/// errors : null

class PrivacyPolicyModel {
  PrivacyPolicyModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  PrivacyPolicyModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _errors = json['errors'];
  }
  bool? _success;
  List<Data>? _data;
  dynamic _errors;
PrivacyPolicyModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => PrivacyPolicyModel(  success: success ?? _success,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  List<Data>? get data => _data;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['errors'] = _errors;
    return map;
  }

}

/// id : 1
/// description : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without"
/// is_deleted : false
/// created_by : "test"
/// created_at : "2022-09-22T06:23:32.859723Z"
/// updated_at : "2022-09-22T06:23:32.859723Z"

class Data {
  Data({
      num? id, 
      String? description, 
      bool? isDeleted, 
      String? createdBy, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _description = description;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _description;
  bool? _isDeleted;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? description,
  bool? isDeleted,
  String? createdBy,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  description: description ?? _description,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get description => _description;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}