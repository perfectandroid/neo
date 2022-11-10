/// success : true
/// data : {"content":"In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."}
/// errors : null

class TermsConditionModel {
  TermsConditionModel({
      bool? success, 
      Data? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  TermsConditionModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _errors = json['errors'];
  }
  bool? _success;
  Data? _data;
  dynamic _errors;
TermsConditionModel copyWith({  bool? success,
  Data? data,
  dynamic errors,
}) => TermsConditionModel(  success: success ?? _success,
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

/// content : "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available."

class Data {
  Data({
      String? content,}){
    _content = content;
}

  Data.fromJson(dynamic json) {
    _content = json['content'];
  }
  String? _content;
Data copyWith({  String? content,
}) => Data(  content: content ?? _content,
);
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = _content;
    return map;
  }

}