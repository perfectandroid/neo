/// success : true
/// data : {"customer_id":null,"name":"SHIBIN","email":null,"username":"9995740386","address":"HILITE BUSSINESS PARK ","mobile":"9995740386","image":"/media/download_3.jpeg"}
/// errors : null

class ProfileModel {
  ProfileModel({
      bool? success, 
      Data? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  ProfileModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'];
  }
  bool? _success;
  Data? _data;
  dynamic _errors;
ProfileModel copyWith({  bool? success,
  Data? data,
  dynamic errors,
}) => ProfileModel(  success: success ?? _success,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  Data? get data => _data;
  dynamic get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }

}

/// customer_id : null
/// name : "SHIBIN"
/// email : null
/// username : "9995740386"
/// address : "HILITE BUSSINESS PARK "
/// mobile : "9995740386"
/// image : "/media/download_3.jpeg"

class Data {
  Data({
      dynamic customerId, 
      String? name, 
      dynamic email, 
      String? username, 
      String? address, 
      String? mobile, 
      String? image,}){
    _customerId = customerId;
    _name = name;
    _email = email;
    _username = username;
    _address = address;
    _mobile = mobile;
    _image = image;
}

  Data.fromJson(dynamic json) {
    _customerId = json['customer_id'];
    _name = json['name'];
    _email = json['email'];
    _username = json['username'];
    _address = json['address'];
    _mobile = json['mobile'];
    _image = json['image'];
  }
  dynamic _customerId;
  String? _name;
  dynamic _email;
  String? _username;
  String? _address;
  String? _mobile;
  String? _image;
Data copyWith({  dynamic customerId,
  String? name,
  dynamic email,
  String? username,
  String? address,
  String? mobile,
  String? image,
}) => Data(  customerId: customerId ?? _customerId,
  name: name ?? _name,
  email: email ?? _email,
  username: username ?? _username,
  address: address ?? _address,
  mobile: mobile ?? _mobile,
  image: image ?? _image,
);
  dynamic get customerId => _customerId;
  String? get name => _name;
  dynamic get email => _email;
  String? get username => _username;
  String? get address => _address;
  String? get mobile => _mobile;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = _customerId;
    map['name'] = _name;
    map['email'] = _email;
    map['username'] = _username;
    map['address'] = _address;
    map['mobile'] = _mobile;
    map['image'] = _image;
    return map;
  }

}