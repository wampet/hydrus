import 'dart:convert';

ProductsModel productsModelFromJson(String str) => ProductsModel.fromJson(json.decode(str));

String productsModelToJson(ProductsModel data) => json.encode(data.toJson());

class ProductsModel {
    ProductsModel({
        required this.productId,
        required this.name,
        required this.imageUri,
        required this.categoryId,
        required this.shortDescription,
        required this.longDescription,
        required this.countryCode,
        required this.currencyCode,
        required this.isDeleted,
        required this.isActive,
        required this.isExternal,
        required this.sortOrder,
    });

    String productId;
    String name;
    String imageUri;
    String categoryId;
    String shortDescription;
    String longDescription;
    String countryCode;
    String currencyCode;
    bool isDeleted;
    bool isActive;
    bool isExternal;
    int sortOrder;

    factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        productId: json["productId"],
        name: json["name"],
        imageUri: json["imageUri"],
        categoryId: json["categoryId"],
        shortDescription: json["shortDescription"],
        longDescription: json["longDescription"],
        countryCode: json["countryCode"],
        currencyCode: json["currencyCode"],
        isDeleted: json["isDeleted"],
        isActive: json["isActive"],
        isExternal: json["isExternal"],
        sortOrder: json["sortOrder"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "imageUri": imageUri,
        "categoryId": categoryId,
        "shortDescription": shortDescription,
        "longDescription": longDescription,
        "countryCode": countryCode,
        "currencyCode": currencyCode,
        "isDeleted": isDeleted,
        "isActive": isActive,
        "isExternal": isExternal,
        "sortOrder": sortOrder,
    };
}
