/// success : true
/// data : [{"stock_id":20,"stk_batch_no":"1234","expiry_date":"2022-10-10","stk_mrp":50.5,"sale_mrp":"10.00","cur_qty":10,"purchase_rate":"8.00","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T08:48:37.929000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Black Forest Cake","category":"Food and dining","sub_category":"Cakes and Bakes","payment_method":1,"detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"cakes.jpeg","seller":"Seller"},{"stock_id":21,"stk_batch_no":null,"expiry_date":null,"stk_mrp":15.8,"sale_mrp":"59.00","cur_qty":10,"purchase_rate":"56.80","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T13:44:40.535000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":"2022-10-10T13:45:10.798000Z","backup_id":null,"user":4,"product":"Tomato","category":"Vegetables","sub_category":"Organic Foods","payment_method":1,"detail_page_products":[],"product_id":1,"sub_category_id":1,"category_id":1,"front_image":"Tomato.jpeg","seller":"Seller"},{"stock_id":22,"stk_batch_no":null,"expiry_date":null,"stk_mrp":51.4,"sale_mrp":"56.11","cur_qty":3,"purchase_rate":"56.99","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T13:47:42.213000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Black Forest Cake","category":"Food and dining","sub_category":"Cakes and Bakes","payment_method":1,"detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"cakes.jpeg","seller":"Seller"},{"stock_id":23,"stk_batch_no":null,"expiry_date":null,"stk_mrp":21.8,"sale_mrp":"21.99","cur_qty":78,"purchase_rate":"22.90","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T13:48:17.155000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Black Forest Cake","category":"Food and dining","sub_category":"Cakes and Bakes","payment_method":1,"detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"cakes.jpeg","seller":"Seller"},{"stock_id":24,"stk_batch_no":null,"expiry_date":null,"stk_mrp":4.4,"sale_mrp":"3.90","cur_qty":90,"purchase_rate":"3.90","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T14:11:55.401000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Tomato","category":"Vegetables","sub_category":"Organic Foods","payment_method":1,"detail_page_products":[],"product_id":1,"sub_category_id":1,"category_id":1,"front_image":"Tomato.jpeg","seller":"Seller"},{"stock_id":25,"stk_batch_no":null,"expiry_date":null,"stk_mrp":80.0,"sale_mrp":"78.90","cur_qty":90,"purchase_rate":"78.90","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-10T14:16:11.617000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Black Forest Cake","category":"Food and dining","sub_category":"Cakes and Bakes","payment_method":1,"detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"cakes.jpeg","seller":"Seller"},{"stock_id":26,"stk_batch_no":null,"expiry_date":null,"stk_mrp":67.89,"sale_mrp":"67.89","cur_qty":10,"purchase_rate":"67.89","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-11T05:15:40.090000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Broccoli","category":"Vegetables","sub_category":"Organic Foods","payment_method":1,"detail_page_products":[],"product_id":6,"sub_category_id":1,"category_id":1,"front_image":"broc.jfif","seller":"Seller"},{"stock_id":27,"stk_batch_no":null,"expiry_date":null,"stk_mrp":250.0,"sale_mrp":"250.00","cur_qty":1,"purchase_rate":"200.00","featured":false,"is_offer":false,"offer_type":null,"offer_price_val":null,"description":"","best_sellers":false,"is_deleted":false,"created_by":"8086627226","created_at":"2022-10-12T10:14:58.841000Z","cancel_by":"","cancel_at":null,"updated_by":"8086627226","updated_at":null,"backup_id":null,"user":4,"product":"Black Forest Cake","category":"Food and dining","sub_category":"Cakes and Bakes","payment_method":1,"detail_page_products":[],"product_id":2,"sub_category_id":2,"category_id":2,"front_image":"cakes.jpeg","seller":"Seller"}]
/// errors : ""
/// 
/// 

class DetailImageInfoModel{
  DetailImageInfoModel({num? image_id,String? imageUrl}){
    image_id = image_id;
    imageUrl = imageUrl;
  }
  
  factory DetailImageInfoModel.fromJson(Map<String, dynamic> json){
     return DetailImageInfoModel(
      image_id: json["id "] as num ,
      imageUrl: json["image"] as String 
     );
     
  }

}

class SockReportListModel {
  SockReportListModel({
      bool? success, 
      List<Data>? data, 
      String? errors,}){
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
  String? _errors;
SockReportListModel copyWith({  bool? success,
  List<Data>? data,
  String? errors,
}) => SockReportListModel(  success: success ?? _success,
  data: data ?? _data,
  errors: errors ?? _errors,
);
  bool? get success => _success;
  List<Data>? get data => _data;
  String? get errors => _errors;

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

/// stock_id : 20
/// stk_batch_no : "1234"
/// expiry_date : "2022-10-10"
/// stk_mrp : 50.5
/// sale_mrp : "10.00"
/// cur_qty : 10
/// purchase_rate : "8.00"
/// featured : false
/// is_offer : false
/// offer_type : null
/// offer_price_val : null
/// description : ""
/// best_sellers : false
/// is_deleted : false
/// created_by : "8086627226"
/// created_at : "2022-10-10T08:48:37.929000Z"
/// cancel_by : ""
/// cancel_at : null
/// updated_by : "8086627226"
/// updated_at : null
/// backup_id : null
/// user : 4
/// product : "Black Forest Cake"
/// category : "Food and dining"
/// sub_category : "Cakes and Bakes"
/// payment_method : 1
/// detail_page_products : []
/// product_id : 2
/// sub_category_id : 2
/// category_id : 2
/// front_image : "cakes.jpeg"
/// seller : "Seller"

class Data {
  Data({
      num? stockId, 
      String? stkBatchNo,
      List<DetailImageInfoModel>? imageList,
      String? expiryDate, 
      String? stkMrp, 
      num? saleMrp, 
      num? curQty, 
      String? purchaseRate, 
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
      num? paymentMethod, 
      List<dynamic>? detailPageProducts, 
      num? productId, 
      num? subCategoryId, 
      num? categoryId, 
      String? frontImage, 
      String? seller,})
      {
    _stockId = stockId;
    _stkBatchNo = stkBatchNo;
    _expiryDate = expiryDate;
    _imageList = imageList;
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
    _paymentMethod = paymentMethod;
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
    _saleMrp = json['sale_price'];
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
    _paymentMethod = json['payment_method'];
    if (json['detail_page_products'] != null) {
      _detailPageProducts = [];
      json['detail_page_products'].forEach((v) {
       // _detailPageProducts?.add(Dynamic.fromJson(v));
      });
    }
    if (json['details_image'] != null){
      _imageList = [];
      json['details_image'].forEach((v){
        _imageList?.add(DetailImageInfoModel.fromJson(v));
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
  List<DetailImageInfoModel>?  _imageList;
  dynamic? _stkMrp;
  num? _saleMrp;
  num? _curQty;
  String? _purchaseRate;
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
  num? _paymentMethod;
  List<dynamic>? _detailPageProducts;
  num? _productId;
  num? _subCategoryId;
  num? _categoryId;
  String? _frontImage;
  String? _seller;
Data copyWith({  num? stockId,
  String? stkBatchNo,
  String? expiryDate,
  List<DetailImageInfoModel>?  imageList,
  String? stkMrp,
  num? saleMrp,
  num? curQty,
  String? purchaseRate,
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
  num? paymentMethod,
  List<dynamic>? detailPageProducts,
  num? productId,
  num? subCategoryId,
  num? categoryId,
  String? frontImage,
  String? seller,
}) => Data(  stockId: stockId ?? _stockId,
  stkBatchNo: stkBatchNo ?? _stkBatchNo,
  expiryDate: expiryDate ?? _expiryDate,
  imageList: imageList ?? _imageList,
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
  paymentMethod: paymentMethod ?? _paymentMethod,
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
   List<DetailImageInfoModel>? get imageList => _imageList;
  dynamic? get stkMrp => _stkMrp;
  num? get saleMrp => _saleMrp;
  num? get curQty => _curQty;
  String? get purchaseRate => _purchaseRate;
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
  num? get paymentMethod => _paymentMethod;
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
    map['sale_price'] = _saleMrp;
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
    map['payment_method'] = _paymentMethod;
    if (_detailPageProducts != null) {
      map['detail_page_products'] = _detailPageProducts?.map((v) => v.toJson()).toList();
    }
    // if (_imageList != null){
    //   map['details_image'] = _imageList?.map((v) =>  DetailImageInfoModel.fromJson(v)).toList();
    // }
    map['product_id'] = _productId;
    map['sub_category_id'] = _subCategoryId;
    map['category_id'] = _categoryId;
    map['front_image'] = _frontImage;
    map['seller'] = _seller;
    return map;
  }

}