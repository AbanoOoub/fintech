import 'package:fintech/core/enum/order_status_enum.dart';

class OrderModel {
  String id;
  bool isActive;
  String price;
  String company;
  String picture;
  String buyer;
  List<String> tags;
  OrderStatus status;
  String registered;

  OrderModel({
    required this.id,
    required this.isActive,
    required this.price,
    required this.company,
    required this.picture,
    required this.buyer,
    required this.tags,
    required this.status,
    required this.registered,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        isActive: json["isActive"],
        price: json["price"],
        company: json["company"],
        picture: json["picture"],
        buyer: json["buyer"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        status: OrderStatusHelper.getOrderStatus(status: json["status"]),
        registered: json["registered"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "isActive": isActive,
        "price": price,
        "company": company,
        "picture": picture,
        "buyer": buyer,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "status": status,
        "registered": registered,
      };
}
