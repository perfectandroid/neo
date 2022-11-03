class NotificationModel{
  //data Type
  int? id;
  String? user;
  String? order;
  String? product;

// constructor
  NotificationModel(
      {
        this.id,
        this.user,
        this.order,
        this.product,

      }
      );
  //method that assign values to respective datatype vairables
  NotificationModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    user =json['user'];
    order = json['fk_order'];
    product = json['fk_product'];

  }
}