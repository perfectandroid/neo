/// success : true
/// data : [{"sub_cat_id":1,"machine":null,"name":"raw","short_name":"cxxbbc","sort_order":null,"slug":"raw","is_deleted":false,"created_by":"","backup_id":null,"user":1,"fk_category":1}]
/// errors : null

class SubcategoryModel {
  SubcategoryModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  SubcategoryModel.fromJson(dynamic json) {
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
SubcategoryModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => SubcategoryModel(  success: success ?? _success,
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

/// sub_cat_id : 1
/// machine : null
/// name : "raw"
/// short_name : "cxxbbc"
/// sort_order : null
/// slug : "raw"
/// is_deleted : false
/// created_by : ""
/// backup_id : null
/// user : 1
/// fk_category : 1

class Data {
  Data({
      num? subCatId, 
      dynamic machine, 
      String? name, 
      String? shortName, 
      dynamic sortOrder, 
      String? slug, 
      bool? isDeleted, 
      String? createdBy, 
      dynamic backupId, 
      num? user, 
      num? fkCategory,}){
    _subCatId = subCatId;
    _machine = machine;
    _name = name;
    _shortName = shortName;
    _sortOrder = sortOrder;
    _slug = slug;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _backupId = backupId;
    _user = user;
    _fkCategory = fkCategory;
}

  Data.fromJson(dynamic json) {
    _subCatId = json['sub_cat_id'];
    _machine = json['machine'];
    _name = json['name'];
    _shortName = json['short_name'];
    _sortOrder = json['sort_order'];
    _slug = json['slug'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _backupId = json['backup_id'];
    _user = json['user'];
    _fkCategory = json['fk_category'];
  }
  num? _subCatId;
  dynamic _machine;
  String? _name;
  String? _shortName;
  dynamic _sortOrder;
  String? _slug;
  bool? _isDeleted;
  String? _createdBy;
  dynamic _backupId;
  num? _user;
  num? _fkCategory;
Data copyWith({  num? subCatId,
  dynamic machine,
  String? name,
  String? shortName,
  dynamic sortOrder,
  String? slug,
  bool? isDeleted,
  String? createdBy,
  dynamic backupId,
  num? user,
  num? fkCategory,
}) => Data(  subCatId: subCatId ?? _subCatId,
  machine: machine ?? _machine,
  name: name ?? _name,
  shortName: shortName ?? _shortName,
  sortOrder: sortOrder ?? _sortOrder,
  slug: slug ?? _slug,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  backupId: backupId ?? _backupId,
  user: user ?? _user,
  fkCategory: fkCategory ?? _fkCategory,
);
  num? get subCatId => _subCatId;
  dynamic get machine => _machine;
  String? get name => _name;
  String? get shortName => _shortName;
  dynamic get sortOrder => _sortOrder;
  String? get slug => _slug;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  dynamic get backupId => _backupId;
  num? get user => _user;
  num? get fkCategory => _fkCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_cat_id'] = _subCatId;
    map['machine'] = _machine;
    map['name'] = _name;
    map['short_name'] = _shortName;
    map['sort_order'] = _sortOrder;
    map['slug'] = _slug;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['backup_id'] = _backupId;
    map['user'] = _user;
    map['fk_category'] = _fkCategory;
    return map;
  }

}