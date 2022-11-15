/// success : true
/// data : [{"cat_id":1,"machine":null,"name":"goods","short_name":"cvbn","category_image":"/media/dress_5Wk9Hc5.png","sort_order":null,"slug":"goods","is_deleted":false,"created_by":"neo","created_at":"2022-09-22T06:28:43.074212Z","updated_at":null,"backup_id":null,"user":1},{"cat_id":3,"machine":null,"name":"bank","short_name":"nmbg","category_image":"/media/dress_UdXm30g.png","sort_order":null,"slug":"bank","is_deleted":false,"created_by":"neo","created_at":"2022-10-19T06:35:18.152117Z","updated_at":null,"backup_id":null,"user":1},{"cat_id":2,"machine":null,"name":"Retailer","short_name":"fbgf","category_image":"/media/download_1_TwlMWuE.jpeg","sort_order":null,"slug":"retailer","is_deleted":false,"created_by":"neo","created_at":"2022-10-19T06:35:03.014720Z","updated_at":null,"backup_id":null,"user":1}]
/// errors : null

class CategoryModel {
  CategoryModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  CategoryModel.fromJson(dynamic json) {
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
CategoryModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => CategoryModel(  success: success ?? _success,
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

/// cat_id : 1
/// machine : null
/// name : "goods"
/// short_name : "cvbn"
/// category_image : "/media/dress_5Wk9Hc5.png"
/// sort_order : null
/// slug : "goods"
/// is_deleted : false
/// created_by : "neo"
/// created_at : "2022-09-22T06:28:43.074212Z"
/// updated_at : null
/// backup_id : null
/// user : 1

class Data {
  Data({
      num? catId, 
      dynamic machine, 
      String? name, 
      String? shortName, 
      String? categoryImage, 
      dynamic sortOrder, 
      String? slug, 
      bool? isDeleted, 
      String? createdBy, 
      String? createdAt, 
      dynamic updatedAt, 
      dynamic backupId, 
      num? user,}){
    _catId = catId;
    _machine = machine;
    _name = name;
    _shortName = shortName;
    _categoryImage = categoryImage;
    _sortOrder = sortOrder;
    _slug = slug;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _backupId = backupId;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _catId = json['cat_id'];
    _machine = json['machine'];
    _name = json['name'];
    _shortName = json['short_name'];
    _categoryImage = json['category_image'];
    _sortOrder = json['sort_order'];
    _slug = json['slug'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _backupId = json['backup_id'];
    _user = json['user'];
  }
  num? _catId;
  dynamic _machine;
  String? _name;
  String? _shortName;
  String? _categoryImage;
  dynamic _sortOrder;
  String? _slug;
  bool? _isDeleted;
  String? _createdBy;
  String? _createdAt;
  dynamic _updatedAt;
  dynamic _backupId;
  num? _user;
Data copyWith({  num? catId,
  dynamic machine,
  String? name,
  String? shortName,
  String? categoryImage,
  dynamic sortOrder,
  String? slug,
  bool? isDeleted,
  String? createdBy,
  String? createdAt,
  dynamic updatedAt,
  dynamic backupId,
  num? user,
}) => Data(  catId: catId ?? _catId,
  machine: machine ?? _machine,
  name: name ?? _name,
  shortName: shortName ?? _shortName,
  categoryImage: categoryImage ?? _categoryImage,
  sortOrder: sortOrder ?? _sortOrder,
  slug: slug ?? _slug,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  backupId: backupId ?? _backupId,
  user: user ?? _user,
);
  num? get catId => _catId;
  dynamic get machine => _machine;
  String? get name => _name;
  String? get shortName => _shortName;
  String? get categoryImage => _categoryImage;
  dynamic get sortOrder => _sortOrder;
  String? get slug => _slug;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  dynamic get backupId => _backupId;
  num? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cat_id'] = _catId;
    map['machine'] = _machine;
    map['name'] = _name;
    map['short_name'] = _shortName;
    map['category_image'] = _categoryImage;
    map['sort_order'] = _sortOrder;
    map['slug'] = _slug;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['backup_id'] = _backupId;
    map['user'] = _user;
    return map;
  }

}