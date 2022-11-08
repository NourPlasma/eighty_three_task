/// status : 1
/// data : {"category_total_count":36,"addresses":[{"id":1,"image":"https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg","title":"Home Address","address":"Mustafa St. No:2 Street x12"},{"id":2,"image":"https://media.architecturaldigest.com/photos/56b524de4ac3d842677b9ac0/master/w_2323,h_1548,c_limit/home-office-01.jpg","title":"Office Address","address":"Axis Istanbul, B2 Blok Floor 2, Office 11"},{"id":3,"image":"https://api.time.com/wp-content/uploads/2021/02/laptop-home-office.jpg","title":"Work Address","address":"Babers St. No:4 Street x9"}],"offers_banners":[{"id":1,"image":"https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg"}],"categories":[{"id":1,"name":"Steak","image":"https://assets.bonappetit.com/photos/57ad5452f1c801a1038bcb97/master/pass/perfect-porterhouse-steak.jpg"},{"id":2,"name":"Vegetables","image":"https://www.cdc.gov/foodsafety/images/comms/features/GettyImages-1247930626-500px.jpg"},{"id":3,"name":"Beverages","image":"https://c.ndtvimg.com/2021-02/e2uarbeo_juice-_625x300_25_February_21.jpg"},{"id":4,"name":"Fish","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg"},{"id":5,"name":"Juice","image":"https://www.alphafoodie.com/wp-content/uploads/2020/11/Orange-Juice-1-of-1-500x500.jpeg"}],"deals":[{"id":1,"name":"Red Juice","time":"15 Minutes Away","quantity":100,"discounted_price":10,"original_price":20,"type":"Bottle","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false},{"id":2,"name":"Salmon Meal","time":"1 Hour Away","quantity":50,"discounted_price":50,"original_price":80,"type":"Serving","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false},{"id":3,"name":"Summer Sun Ice Cream Pack","time":"30 Minutes Away","quantity":5,"discounted_price":15,"original_price":20,"type":"Pieces","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false}]}

class GroceryModel {
  GroceryModel({
      this.status, 
      this.data,});

  GroceryModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? status;
  Data? data;
GroceryModel copyWith({  num? status,
  Data? data,
}) => GroceryModel(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// category_total_count : 36
/// addresses : [{"id":1,"image":"https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg","title":"Home Address","address":"Mustafa St. No:2 Street x12"},{"id":2,"image":"https://media.architecturaldigest.com/photos/56b524de4ac3d842677b9ac0/master/w_2323,h_1548,c_limit/home-office-01.jpg","title":"Office Address","address":"Axis Istanbul, B2 Blok Floor 2, Office 11"},{"id":3,"image":"https://api.time.com/wp-content/uploads/2021/02/laptop-home-office.jpg","title":"Work Address","address":"Babers St. No:4 Street x9"}]
/// offers_banners : [{"id":1,"image":"https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg"}]
/// categories : [{"id":1,"name":"Steak","image":"https://assets.bonappetit.com/photos/57ad5452f1c801a1038bcb97/master/pass/perfect-porterhouse-steak.jpg"},{"id":2,"name":"Vegetables","image":"https://www.cdc.gov/foodsafety/images/comms/features/GettyImages-1247930626-500px.jpg"},{"id":3,"name":"Beverages","image":"https://c.ndtvimg.com/2021-02/e2uarbeo_juice-_625x300_25_February_21.jpg"},{"id":4,"name":"Fish","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg"},{"id":5,"name":"Juice","image":"https://www.alphafoodie.com/wp-content/uploads/2020/11/Orange-Juice-1-of-1-500x500.jpeg"}]
/// deals : [{"id":1,"name":"Red Juice","time":"15 Minutes Away","quantity":100,"discounted_price":10,"original_price":20,"type":"Bottle","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false},{"id":2,"name":"Salmon Meal","time":"1 Hour Away","quantity":50,"discounted_price":50,"original_price":80,"type":"Serving","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false},{"id":3,"name":"Summer Sun Ice Cream Pack","time":"30 Minutes Away","quantity":5,"discounted_price":15,"original_price":20,"type":"Pieces","image":"http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg","is_favourite":false}]

class Data {
  Data({
      this.categoryTotalCount, 
      this.addresses, 
      this.offersBanners, 
      this.categories, 
      this.deals,});

  Data.fromJson(dynamic json) {
    categoryTotalCount = json['category_total_count'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
    if (json['offers_banners'] != null) {
      offersBanners = [];
      json['offers_banners'].forEach((v) {
        offersBanners?.add(OffersBanners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['deals'] != null) {
      deals = [];
      json['deals'].forEach((v) {
        deals?.add(Deals.fromJson(v));
      });
    }
  }
  num? categoryTotalCount;
  List<Addresses>? addresses;
  List<OffersBanners>? offersBanners;
  List<Categories>? categories;
  List<Deals>? deals;
Data copyWith({  num? categoryTotalCount,
  List<Addresses>? addresses,
  List<OffersBanners>? offersBanners,
  List<Categories>? categories,
  List<Deals>? deals,
}) => Data(  categoryTotalCount: categoryTotalCount ?? this.categoryTotalCount,
  addresses: addresses ?? this.addresses,
  offersBanners: offersBanners ?? this.offersBanners,
  categories: categories ?? this.categories,
  deals: deals ?? this.deals,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_total_count'] = categoryTotalCount;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    if (offersBanners != null) {
      map['offers_banners'] = offersBanners?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (deals != null) {
      map['deals'] = deals?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Red Juice"
/// time : "15 Minutes Away"
/// quantity : 100
/// discounted_price : 10
/// original_price : 20
/// type : "Bottle"
/// image : "http://www.reef2rainforest.com/wp-content/uploads/2015/04/shutterstock_fish-mkt.jpg"
/// is_favourite : false

class Deals {
  Deals({
      this.id, 
      this.name, 
      this.time, 
      this.quantity, 
      this.discountedPrice, 
      this.originalPrice, 
      this.type, 
      this.image, 
      this.isFavourite,});

  Deals.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    time = json['time'];
    quantity = json['quantity'];
    discountedPrice = json['discounted_price'];
    originalPrice = json['original_price'];
    type = json['type'];
    image = json['image'];
    isFavourite = json['is_favourite'];
  }
  num? id;
  String? name;
  String? time;
  num? quantity;
  num? discountedPrice;
  num? originalPrice;
  String? type;
  String? image;
  bool? isFavourite;
Deals copyWith({  num? id,
  String? name,
  String? time,
  num? quantity,
  num? discountedPrice,
  num? originalPrice,
  String? type,
  String? image,
  bool? isFavourite,
}) => Deals(  id: id ?? this.id,
  name: name ?? this.name,
  time: time ?? this.time,
  quantity: quantity ?? this.quantity,
  discountedPrice: discountedPrice ?? this.discountedPrice,
  originalPrice: originalPrice ?? this.originalPrice,
  type: type ?? this.type,
  image: image ?? this.image,
  isFavourite: isFavourite ?? this.isFavourite,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['time'] = time;
    map['quantity'] = quantity;
    map['discounted_price'] = discountedPrice;
    map['original_price'] = originalPrice;
    map['type'] = type;
    map['image'] = image;
    map['is_favourite'] = isFavourite;
    return map;
  }

}

/// id : 1
/// name : "Steak"
/// image : "https://assets.bonappetit.com/photos/57ad5452f1c801a1038bcb97/master/pass/perfect-porterhouse-steak.jpg"

class Categories {
  Categories({
      this.id, 
      this.name, 
      this.image,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;
Categories copyWith({  num? id,
  String? name,
  String? image,
}) => Categories(  id: id ?? this.id,
  name: name ?? this.name,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }

}

/// id : 1
/// image : "https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg"

class OffersBanners {
  OffersBanners({
      this.id, 
      this.image,});

  OffersBanners.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  num? id;
  String? image;
OffersBanners copyWith({  num? id,
  String? image,
}) => OffersBanners(  id: id ?? this.id,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }

}

/// id : 1
/// image : "https://foyr.com/learn/wp-content/uploads/2021/08/design-your-dream-home.jpg"
/// title : "Home Address"
/// address : "Mustafa St. No:2 Street x12"

class Addresses {
  Addresses({
      this.id, 
      this.image, 
      this.title, 
      this.address,});

  Addresses.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    address = json['address'];
  }
  num? id;
  String? image;
  String? title;
  String? address;
Addresses copyWith({  num? id,
  String? image,
  String? title,
  String? address,
}) => Addresses(  id: id ?? this.id,
  image: image ?? this.image,
  title: title ?? this.title,
  address: address ?? this.address,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['title'] = title;
    map['address'] = address;
    return map;
  }

}