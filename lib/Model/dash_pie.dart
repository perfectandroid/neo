import 'dart:convert';

CategoriesCount categoriescountfromjson(String str) =>
    CategoriesCount.fromJson(json.decode(str));

String categoriescounttojson(CategoriesCount data) =>
    json.encode(data.toJson());


class PieModel {
  bool? success;
  Data? data;
  Null? errors;

  PieModel({this.success, this.data, this.errors});

  PieModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['errors'] = this.errors;
    return data;
  }
}

class Data {
  CategoriesCount? categoriesCount;
  DailySalesCount? dailySalesCount;
  List<String>? categoriesList;
  List<int>? productCountList;
  List<String>? days;
  List<int>? sales;

  Data(
      {this.categoriesCount,
        this.dailySalesCount,
        this.categoriesList,
        this.productCountList,
        this.days,
        this.sales});

  Data.fromJson(Map<String, dynamic> json) {
    categoriesCount = json['categories_count'] != null
        ? new CategoriesCount.fromJson(json['categories_count'])
        : null;
    dailySalesCount = json['daily_sales_count'] != null
        ? new DailySalesCount.fromJson(json['daily_sales_count'])
        : null;
    categoriesList = json['categories_list'].cast<String>();
    productCountList = json['product_count_list'].cast<int>();
    days = json['days'].cast<String>();
    sales = json['sales'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categoriesCount != null) {
      data['categories_count'] = this.categoriesCount!.toJson();
    }
    if (this.dailySalesCount != null) {
      data['daily_sales_count'] = this.dailySalesCount!.toJson();
    }
    data['categories_list'] = this.categoriesList;
    data['product_count_list'] = this.productCountList;
    data['days'] = this.days;
    data['sales'] = this.sales;
    return data;
  }


}

class CategoriesCount {
  int? goods;
  int? bank;
  int? retailer;

  CategoriesCount({this.goods, this.bank, this.retailer});


/*  factory CategoriesCount.fromJson (Map<String,dynamic>json){
    return CategoriesCount(goods: json['goods'],
        bank: json['bank'],
        retailer: json['Retailer']);
  }*/

  CategoriesCount.fromJson(Map<String, dynamic> json) {
    goods = json['goods'];
    bank = json['bank'];
    retailer = json['Retailer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goods'] = this.goods;
    data['bank'] = this.bank;
    data['Retailer'] = this.retailer;
    return data;
  }


}

class DailySalesCount {
  int? i08Nov;
  int? i07Nov;
  int? i06Nov;
  int? i05Nov;
  int? i04Nov;
  int? i03Nov;
  int? i02Nov;

  DailySalesCount(
      {this.i08Nov,
        this.i07Nov,
        this.i06Nov,
        this.i05Nov,
        this.i04Nov,
        this.i03Nov,
        this.i02Nov});

  DailySalesCount.fromJson(Map<String, dynamic> json) {
    i08Nov = json['08-Nov'];
    i07Nov = json['07-Nov'];
    i06Nov = json['06-Nov'];
    i05Nov = json['05-Nov'];
    i04Nov = json['04-Nov'];
    i03Nov = json['03-Nov'];
    i02Nov = json['02-Nov'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['08-Nov'] = this.i08Nov;
    data['07-Nov'] = this.i07Nov;
    data['06-Nov'] = this.i06Nov;
    data['05-Nov'] = this.i05Nov;
    data['04-Nov'] = this.i04Nov;
    data['03-Nov'] = this.i03Nov;
    data['02-Nov'] = this.i02Nov;
    return data;
  }
}