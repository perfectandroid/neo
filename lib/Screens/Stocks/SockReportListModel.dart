/// success : true
/// data : [{"stock_id":1,"stk_batch_no":"1234","expiry_date":"2022-09-22","stk_mrp":78,"sale_mrp":10,"cur_qty":400,"purchase_rate":9.0,"featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"9995740386","created_at":"2022-09-22T06:30:37.982252Z","cancel_by":"6666","cancel_at":null,"updated_by":"9995740386","updated_at":null,"backup_id":null,"user":5,"product":"salt","category":"Retailer","sub_category":"df","detail_page_products":[],"product_id":1,"sub_category_id":2,"category_id":2,"front_image":"salt_Ueu7hE0.jpeg","seller":"sellernew"},{"stock_id":2,"stk_batch_no":"123456","expiry_date":"2022-09-23","stk_mrp":10,"sale_mrp":10,"cur_qty":0,"purchase_rate":8.0,"featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"9995740386","created_at":"2022-09-22T06:31:02.428084Z","cancel_by":"","cancel_at":null,"updated_by":"9995740386","updated_at":null,"backup_id":null,"user":5,"product":"salt","category":"Retailer","sub_category":"df","detail_page_products":[],"product_id":1,"sub_category_id":2,"category_id":2,"front_image":"salt_Ueu7hE0.jpeg","seller":"sellernew"},{"stock_id":3,"stk_batch_no":"1234567","expiry_date":"2022-09-23","stk_mrp":10,"sale_mrp":12,"cur_qty":4,"purchase_rate":8.0,"featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"9995740386","created_at":"2022-09-22T06:31:38.973664Z","cancel_by":"","cancel_at":null,"updated_by":"9995740386","updated_at":null,"backup_id":null,"user":5,"product":"salt","category":"Retailer","sub_category":"df","detail_page_products":[],"product_id":1,"sub_category_id":2,"category_id":2,"front_image":"salt_Ueu7hE0.jpeg","seller":"sellernew"},{"stock_id":4,"stk_batch_no":"1234","expiry_date":"2022-10-08","stk_mrp":10,"sale_mrp":12,"cur_qty":10,"purchase_rate":8.0,"featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"9995740386","created_at":"2022-10-01T04:54:03.233290Z","cancel_by":"","cancel_at":null,"updated_by":"9995740386","updated_at":null,"backup_id":null,"user":5,"product":"salt","category":"Retailer","sub_category":"df","detail_page_products":[],"product_id":1,"sub_category_id":2,"category_id":2,"front_image":"salt_Ueu7hE0.jpeg","seller":"sellernew"},{"stock_id":5,"stk_batch_no":"123456","expiry_date":"2022-10-18","stk_mrp":100,"sale_mrp":100,"cur_qty":9300,"purchase_rate":75.0,"featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"9995740386","created_at":"2022-10-18T11:51:23.575503Z","cancel_by":"","cancel_at":null,"updated_by":"9995740386","updated_at":null,"backup_id":null,"user":5,"product":"sweets","category":"Retailer","sub_category":"df","detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"dairy_5U1lcQx.png","seller":"sellernew"}]
/// errors : null

class SockReportListModel {
  SockReportListModel({
      bool? success, 
      List<Data>? data, 
      dynamic errors,}){
    _success = success;
    _data = data;
    _errors = errors;
}

  SockReportListModel.fromJson(dynamic json) {
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
SockReportListModel copyWith({  bool? success,
  List<Data>? data,
  dynamic errors,
}) => SockReportListModel(  success: success ?? _success,
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

/// stock_id : 1
/// stk_batch_no : "1234"
/// expiry_date : "2022-09-22"
/// stk_mrp : 78
/// sale_mrp : 10
/// cur_qty : 400
/// purchase_rate : 9.0
/// featured : false
/// is_offer : false
/// offer_type : null
/// offer_price_val : null
/// description : ""
/// best_sellers : false
/// is_deleted : false
/// created_by : "9995740386"
/// created_at : "2022-09-22T06:30:37.982252Z"
/// cancel_by : "6666"
/// cancel_at : null
/// updated_by : "9995740386"
/// updated_at : null
/// backup_id : null
/// user : 5
/// product : "salt"
/// category : "Retailer"
/// sub_category : "df"
/// detail_page_products : []
/// product_id : 1
/// sub_category_id : 2
/// category_id : 2
/// front_image : "salt_Ueu7hE0.jpeg"
/// seller : "sellernew"

class Data {
  Data({
      num? stockId, 
      String? stkBatchNo, 
      String? expiryDate, 
      num? stkMrp, 
      num? saleMrp, 
      num? curQty, 
      num? purchaseRate, 
      bool? featured, 
      bool? isOffer, 
      dynamic offerType, 
      dynamic offerPriceVal, 
      String? description, 
      bool? bestSellers, 
      bool? isDeleted, 
      String? createdBy, 
      String? createdAt, 
      String? cancelBy, 
      dynamic cancelAt, 
      String? updatedBy, 
      dynamic updatedAt, 
      dynamic backupId, 
      num? user, 
      String? product, 
      String? category, 
      String? subCategory, 
      List<dynamic>? detailPageProducts, 
      num? productId, 
      num? subCategoryId, 
      num? categoryId, 
      String? frontImage, 
      String? seller,}){
    _stockId = stockId;
    _stkBatchNo = stkBatchNo;
    _expiryDate = expiryDate;
    _stkMrp = stkMrp;
    _saleMrp = saleMrp;
    _curQty = curQty;
    _purchaseRate = purchaseRate;
    _featured = featured;
    _isOffer = isOffer;
    _offerType = offerType;
    _offerPriceVal = offerPriceVal;
    _description = description;
    _bestSellers = bestSellers;
    _isDeleted = isDeleted;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _cancelBy = cancelBy;
    _cancelAt = cancelAt;
    _updatedBy = updatedBy;
    _updatedAt = updatedAt;
    _backupId = backupId;
    _user = user;
    _product = product;
    _category = category;
    _subCategory = subCategory;
    _detailPageProducts = detailPageProducts;
    _productId = productId;
    _subCategoryId = subCategoryId;
    _categoryId = categoryId;
    _frontImage = frontImage;
    _seller = seller;
}

  Data.fromJson(dynamic json) {
    _stockId = json['stock_id'];
    _stkBatchNo = json['stk_batch_no'];
    _expiryDate = json['expiry_date'];
    _stkMrp = json['stk_mrp'];
    _saleMrp = json['sale_mrp'];
    _curQty = json['cur_qty'];
    _purchaseRate = json['purchase_rate'];
    _featured = json['featured'];
    _isOffer = json['is_offer'];
    _offerType = json['offer_type'];
    _offerPriceVal = json['offer_price_val'];
    _description = json['description'];
    _bestSellers = json['best_sellers'];
    _isDeleted = json['is_deleted'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _cancelBy = json['cancel_by'];
    _cancelAt = json['cancel_at'];
    _updatedBy = json['updated_by'];
    _updatedAt = json['updated_at'];
    _backupId = json['backup_id'];
    _user = json['user'];
    _product = json['product'];
    _category = json['category'];
    _subCategory = json['sub_category'];
    if (json['detail_page_products'] != null) {
      _detailPageProducts = [];
      json['detail_page_products'].forEach((v) {
      //  _detailPageProducts?.add(Dynamic.fromJson(v));
      });
    }
    _productId = json['product_id'];
    _subCategoryId = json['sub_category_id'];
    _categoryId = json['category_id'];
    _frontImage = json['front_image'];
    _seller = json['seller'];
  }
  num? _stockId;
  String? _stkBatchNo;
  String? _expiryDate;
  num? _stkMrp;
  num? _saleMrp;
  num? _curQty;
  num? _purchaseRate;
  bool? _featured;
  bool? _isOffer;
  dynamic _offerType;
  dynamic _offerPriceVal;
  String? _description;
  bool? _bestSellers;
  bool? _isDeleted;
  String? _createdBy;
  String? _createdAt;
  String? _cancelBy;
  dynamic _cancelAt;
  String? _updatedBy;
  dynamic _updatedAt;
  dynamic _backupId;
  num? _user;
  String? _product;
  String? _category;
  String? _subCategory;
  List<dynamic>? _detailPageProducts;
  num? _productId;
  num? _subCategoryId;
  num? _categoryId;
  String? _frontImage;
  String? _seller;
Data copyWith({  num? stockId,
  String? stkBatchNo,
  String? expiryDate,
  num? stkMrp,
  num? saleMrp,
  num? curQty,
  num? purchaseRate,
  bool? featured,
  bool? isOffer,
  dynamic offerType,
  dynamic offerPriceVal,
  String? description,
  bool? bestSellers,
  bool? isDeleted,
  String? createdBy,
  String? createdAt,
  String? cancelBy,
  dynamic cancelAt,
  String? updatedBy,
  dynamic updatedAt,
  dynamic backupId,
  num? user,
  String? product,
  String? category,
  String? subCategory,
  List<dynamic>? detailPageProducts,
  num? productId,
  num? subCategoryId,
  num? categoryId,
  String? frontImage,
  String? seller,
}) => Data(  stockId: stockId ?? _stockId,
  stkBatchNo: stkBatchNo ?? _stkBatchNo,
  expiryDate: expiryDate ?? _expiryDate,
  stkMrp: stkMrp ?? _stkMrp,
  saleMrp: saleMrp ?? _saleMrp,
  curQty: curQty ?? _curQty,
  purchaseRate: purchaseRate ?? _purchaseRate,
  featured: featured ?? _featured,
  isOffer: isOffer ?? _isOffer,
  offerType: offerType ?? _offerType,
  offerPriceVal: offerPriceVal ?? _offerPriceVal,
  description: description ?? _description,
  bestSellers: bestSellers ?? _bestSellers,
  isDeleted: isDeleted ?? _isDeleted,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  cancelBy: cancelBy ?? _cancelBy,
  cancelAt: cancelAt ?? _cancelAt,
  updatedBy: updatedBy ?? _updatedBy,
  updatedAt: updatedAt ?? _updatedAt,
  backupId: backupId ?? _backupId,
  user: user ?? _user,
  product: product ?? _product,
  category: category ?? _category,
  subCategory: subCategory ?? _subCategory,
  detailPageProducts: detailPageProducts ?? _detailPageProducts,
  productId: productId ?? _productId,
  subCategoryId: subCategoryId ?? _subCategoryId,
  categoryId: categoryId ?? _categoryId,
  frontImage: frontImage ?? _frontImage,
  seller: seller ?? _seller,
);
  num? get stockId => _stockId;
  String? get stkBatchNo => _stkBatchNo;
  String? get expiryDate => _expiryDate;
  num? get stkMrp => _stkMrp;
  num? get saleMrp => _saleMrp;
  num? get curQty => _curQty;
  num? get purchaseRate => _purchaseRate;
  bool? get featured => _featured;
  bool? get isOffer => _isOffer;
  dynamic get offerType => _offerType;
  dynamic get offerPriceVal => _offerPriceVal;
  String? get description => _description;
  bool? get bestSellers => _bestSellers;
  bool? get isDeleted => _isDeleted;
  String? get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get cancelBy => _cancelBy;
  dynamic get cancelAt => _cancelAt;
  String? get updatedBy => _updatedBy;
  dynamic get updatedAt => _updatedAt;
  dynamic get backupId => _backupId;
  num? get user => _user;
  String? get product => _product;
  String? get category => _category;
  String? get subCategory => _subCategory;
  List<dynamic>? get detailPageProducts => _detailPageProducts;
  num? get productId => _productId;
  num? get subCategoryId => _subCategoryId;
  num? get categoryId => _categoryId;
  String? get frontImage => _frontImage;
  String? get seller => _seller;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stock_id'] = _stockId;
    map['stk_batch_no'] = _stkBatchNo;
    map['expiry_date'] = _expiryDate;
    map['stk_mrp'] = _stkMrp;
    map['sale_mrp'] = _saleMrp;
    map['cur_qty'] = _curQty;
    map['purchase_rate'] = _purchaseRate;
    map['featured'] = _featured;
    map['is_offer'] = _isOffer;
    map['offer_type'] = _offerType;
    map['offer_price_val'] = _offerPriceVal;
    map['description'] = _description;
    map['best_sellers'] = _bestSellers;
    map['is_deleted'] = _isDeleted;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['cancel_by'] = _cancelBy;
    map['cancel_at'] = _cancelAt;
    map['updated_by'] = _updatedBy;
    map['updated_at'] = _updatedAt;
    map['backup_id'] = _backupId;
    map['user'] = _user;
    map['product'] = _product;
    map['category'] = _category;
    map['sub_category'] = _subCategory;
    if (_detailPageProducts != null) {
      map['detail_page_products'] = _detailPageProducts?.map((v) => v.toJson()).toList();
    }
    map['product_id'] = _productId;
    map['sub_category_id'] = _subCategoryId;
    map['category_id'] = _categoryId;
    map['front_image'] = _frontImage;
    map['seller'] = _seller;
    return map;
  }

}