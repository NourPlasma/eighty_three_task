/// item_id : 1
/// name : "n"
/// type : "Serving"
/// one_piece_price : 50
/// quantity : 50
/// cart_quantity : 50
/// image : "n"

class CartSqlModel {
  CartSqlModel({
      this.itemId, 
      this.name, 
      this.type, 
      this.onePiecePrice, 
      this.quantity, 
      this.cartQuantity, 
      this.image,});

  CartSqlModel.fromJson(dynamic json) {
    itemId = json['item_id'];
    name = json['name'];
    type = json['type'];
    onePiecePrice = json['one_piece_price'];
    quantity = json['quantity'];
    cartQuantity = json['cart_quantity'];
    image = json['image'];
  }
  num? itemId;
  String? name;
  String? type;
  num? onePiecePrice;
  num? quantity;
  num? cartQuantity;
  String? image;
CartSqlModel copyWith({  num? itemId,
  String? name,
  String? type,
  num? onePiecePrice,
  num? quantity,
  num? cartQuantity,
  String? image,
}) => CartSqlModel(  itemId: itemId ?? this.itemId,
  name: name ?? this.name,
  type: type ?? this.type,
  onePiecePrice: onePiecePrice ?? this.onePiecePrice,
  quantity: quantity ?? this.quantity,
  cartQuantity: cartQuantity ?? this.cartQuantity,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['name'] = name;
    map['type'] = type;
    map['one_piece_price'] = onePiecePrice;
    map['quantity'] = quantity;
    map['cart_quantity'] = cartQuantity;
    map['image'] = image;
    return map;
  }

}