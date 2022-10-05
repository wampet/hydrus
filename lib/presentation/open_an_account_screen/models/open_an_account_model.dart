import 'dart:convert';
// class OpenAnAccountModel { }

// To parse this JSON data, do
//
//     final openAccountModel = openAccountModelFromJson(jsonString);



OpenAccountModel openAccountModelFromJson(String str) => OpenAccountModel.fromJson(json.decode(str));

String openAccountModelToJson(OpenAccountModel data) => json.encode(data.toJson());

class OpenAccountModel {
    OpenAccountModel({
        required this.message,
        this.data,
        required this.code,
        required this.status,
    });

    String message;
    dynamic data;
    int code;
    String status;

    factory OpenAccountModel.fromJson(Map<String, dynamic> json) => OpenAccountModel(
        message: json["message"],
        data: json["data"],
        code: json["code"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data,
        "code": code,
        "status": status,
    };
}
