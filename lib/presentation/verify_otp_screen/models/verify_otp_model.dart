class VerifyOtpModel {
  List<String>? errors;
  String? correlationId;
  int? code;
  String? status;

  VerifyOtpModel({this.errors, this.correlationId, this.code, this.status});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    errors = json["errors"] == null ? [] : List<String>.from(json["errors"]);
    correlationId = json["correlationId"];
    code = json["code"];
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (errors != null) {
      _data["errors"] = errors;
    }
    _data["correlationId"] = correlationId;
    _data["code"] = code;
    _data["status"] = status;
    return _data;
  }
}
