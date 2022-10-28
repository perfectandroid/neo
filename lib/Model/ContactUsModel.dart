/// success : true
/// data : [{"id":2,"description":"test","facebook":"www.facebook.com","instagram":"www.instagram.com","logo":"/media/logo_NwAkyck.png","mobile":"7894563211","address":"123 block","email":"kcshibin56@gmail.com","testing_url":"http://202.164.150.222:8000/","image_storing_url":"http://202.164.150.222:8000/media/","username":"9995740386","password":"9995740386","is_deleted":false,"created_by":"","created_at":"2022-10-27T10:35:35.602500Z","updated_at":"2022-10-27T10:35:35.602520Z","creator":null}]
/// errors : null

class ContactUsModel {
  ContactUsModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  ContactUsModel.fromJson(dynamic json) {
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
ContactUsModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => ContactUsModel(  success: success ?? _success,
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

/// id : 2
/// description : "test"
/// facebook : "www.facebook.com"
/// instagram : "www.instagram.com"
/// logo : "/media/logo_NwAkyck.png"
/// mobile : "7894563211"
/// address : "123 block"
/// email : "kcshibin56@gmail.com"
/// testing_url : "http://202.164.150.222:8000/"
/// image_storing_url : "http://202.164.150.222:8000/media/"
/// username : "9995740386"
/// password : "9995740386"
/// is_deleted : false
/// created_by : ""
/// created_at : "2022-10-27T10:35:35.602500Z"
/// updated_at : "2022-10-27T10:35:35.602520Z"
/// creator : null

class Data {
  Data({
      num? id, 
      String? description, 
      String? facebook, 
      String? instagram, 
      String? logo, 
      String? mobile, 
      String? address, 
      String? email, 
      String? testingUrl, 
      String? imageStoringUrl, 
      String? username, 
      String? password, 
      bool? isDeleted, 
      String? createdBy, 
      String? createdAt, 
      String? updatedAt, 
      dynamic creator,}){
    _id = id;
    _description = description;
    _facebook = facebook;
    _instagram = instagram;
    _logo = logo;
    _mobile = mobile;
    _address = address;
    _email = email;
    _testingUrl = testingUrl;
    _imageStoringUrl = imageStoringUrl;
    _username = username;
    _password = password;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _creator = creator;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _description = json['description'];
    _facebook = json['facebook'];
    _instagram = json['instagram'];
    _logo = json['logo'];
    _mobile = json['mobile'];
    _address = json['address'];
    _email = json['email'];
    _testingUrl = json['testing_url'];
    _imageStoringUrl = json['image_storing_url'];
    _username = json['username'];
    _password = json['password'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _creator = json['creator'];
  }
  num? _id;
  String? _description;
  String? _facebook;
  String? _instagram;
  String? _logo;
  String? _mobile;
  String? _address;
  String? _email;
  String? _testingUrl;
  String? _imageStoringUrl;
  String? _username;
  String? _password;
  bool? _isDeleted;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;
  dynamic _creator;
Data copyWith({  num? id,
  String? description,
  String? facebook,
  String? instagram,
  String? logo,
  String? mobile,
  String? address,
  String? email,
  String? testingUrl,
  String? imageStoringUrl,
  String? username,
  String? password,
  bool? isDeleted,
  String? createdBy,
  String? createdAt,
  String? updatedAt,
  dynamic creator,
}) => Data(  id: id ?? _id,
  description: description ?? _description,
  facebook: facebook ?? _facebook,
  instagram: instagram ?? _instagram,
  logo: logo ?? _logo,
  mobile: mobile ?? _mobile,
  address: address ?? _address,
  email: email ?? _email,
  testingUrl: testingUrl ?? _testingUrl,
  imageStoringUrl: imageStoringUrl ?? _imageStoringUrl,
  username: username ?? _username,
  password: password ?? _password,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  creator: creator ?? _creator,
);
  num? get id => _id;
  String? get description => _description;
  String? get facebook => _facebook;
  String? get instagram => _instagram;
  String? get logo => _logo;
  String? get mobile => _mobile;
  String? get address => _address;
  String? get email => _email;
  String? get testingUrl => _testingUrl;
  String? get imageStoringUrl => _imageStoringUrl;
  String? get username => _username;
  String? get password => _password;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get creator => _creator;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['description'] = _description;
    map['facebook'] = _facebook;
    map['instagram'] = _instagram;
    map['logo'] = _logo;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['email'] = _email;
    map['testing_url'] = _testingUrl;
    map['image_storing_url'] = _imageStoringUrl;
    map['username'] = _username;
    map['password'] = _password;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['creator'] = _creator;
    return map;
  }

}