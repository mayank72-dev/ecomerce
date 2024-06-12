class ProductModel{
  String? productName;
  List<dynamic>?productImages;
  List<dynamic>?productSize;
  List<dynamic>?productColors;
  String? productId;
  String?productCategory;
  String?productDescriptions;
  int?productRate;
  int?productPrice;

  ProductModel({
    this.productName,this.productCategory,this.productColors,this.productDescriptions,this.productId,this.productImages,this.productPrice,this.productRate,this.productSize
});

  factory ProductModel.fromJson(json)=>ProductModel(
    productCategory: json["productCategory"],
    productColors: json["productColors"],
    productDescriptions: json["productDescriptions"],
    productId: json["productId"],
    productImages: json["productImages"],
    productName: json["productName"],
    productPrice: json["productPrice"],
    productRate: json["productRate"],
    productSize: json["productSize"],

  );
  Map<String ,dynamic> toJson()=>{
    "productCategory":productCategory,
    "productColors":productColors,
    "productDescriptions":productDescriptions,
    "productId":productId,
    "productImages":productImages,
    "productName":productName,
    "productPrice":productPrice,
    "productRate":productRate,
    "productSize":productSize,


  };




}