/// success : true
/// data : [{"id":1,"title":"ABOUT US","description":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia","image":"/media/logo_mYzh9Xa.png","mobile":null,"is_deleted":false,"created_by":"","created_at":"2022-10-17T07:00:06.135261Z","updated_at":"2022-10-17T07:00:06.135283Z"}]
/// errors : null

class AboutUsModel {
  AboutUsModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  AboutUsModel.fromJson(dynamic json) {
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
AboutUsModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => AboutUsModel(  success: success ?? _success,
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
/// title : "ABOUT US"
/// description : "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia"
/// image : "/media/logo_mYzh9Xa.png"
/// mobile : null
/// is_deleted : false
/// created_by : ""
/// created_at : "2022-10-17T07:00:06.135261Z"
/// updated_at : "2022-10-17T07:00:06.135283Z"

class Data {
  Data({
      num? id, 
      String? title, 
      String? description, 
      String? image, 
      dynamic mobile, 
      bool? isDeleted, 
      String? createdBy, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _description = description;
    _image = image;
    _mobile = mobile;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _mobile = json['mobile'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _image;
  dynamic _mobile;
  bool? _isDeleted;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? title,
  String? description,
  String? image,
  dynamic mobile,
  bool? isDeleted,
  String? createdBy,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  image: image ?? _image,
  mobile: mobile ?? _mobile,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get image => _image;
  dynamic get mobile => _mobile;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['mobile'] = _mobile;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}