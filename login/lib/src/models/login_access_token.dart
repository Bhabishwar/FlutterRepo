// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

loginAccessToken loanAccessTokenFromJson(String str) => loginAccessToken.fromJson(json.decode(str));

String loginAccessTokenToJson(loginAccessToken data) => json.encode(data.toJson());

class loginAccessToken {
  loginAccessToken({
    this.error,
    this.message,
    this.customerInfo,
  });

  bool? error;
  String? message;
  CustomerInfo? customerInfo;

  factory loginAccessToken.fromJson(Map<String, dynamic> json) => loginAccessToken(
    error: json["error"],
    message: json["message"],
    customerInfo: CustomerInfo.fromJson(json["customer_info"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "customer_info": customerInfo!.toJson(),
  };
}

class CustomerInfo {
  CustomerInfo({
    this.accessToken,
    this.refreshToken,
    this.userId,
    this.userName,
    this.password,
    this.customerFirstName,
    this.customerMiddleName,
    this.customerLastName,
    this.customerDbo,
    this.activateAccount,
    this.memberId,
    this.tranPin,
    this.isVarified,
    this.activatedDate,
    this.expDate,
    this.smsBanking,
    this.uId,
    this.refreshTokens,
  });

  String? accessToken;
  String? refreshToken;
  int? userId;
  String? userName;
  dynamic? password;
  String? customerFirstName;
  String? customerMiddleName;
  String? customerLastName;
  DateTime? customerDbo;
  String? activateAccount;
  String? memberId;
  dynamic? tranPin;
  int? isVarified;
  DateTime? activatedDate;
  DateTime? expDate;
  int? smsBanking;
  dynamic? uId;
  List<dynamic>? refreshTokens;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    userId: json["userId"],
    userName: json["userName"],
    password: json["password"],
    customerFirstName: json["customer_First_Name"],
    customerMiddleName: json["customer_Middle_Name"],
    customerLastName: json["customer_Last_Name"],
    customerDbo: DateTime.parse(json["customer_DBO"]),
    activateAccount: json["activateAccount"],
    memberId: json["memberId"],
    tranPin: json["tran_Pin"],
    isVarified: json["is_varified"],
    activatedDate: DateTime.parse(json["activated_Date"]),
    expDate: DateTime.parse(json["exp_Date"]),
    smsBanking: json["sms_Banking"],
    uId: json["u_ID"],
    refreshTokens: List<dynamic>.from(json["refreshTokens"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "userId": userId,
    "userName": userName,
    "password": password,
    "customer_First_Name": customerFirstName,
    "customer_Middle_Name": customerMiddleName,
    "customer_Last_Name": customerLastName,
    "customer_DBO": customerDbo!.toIso8601String(),
    "activateAccount": activateAccount,
    "memberId": memberId,
    "tran_Pin": tranPin,
    "is_varified": isVarified,
    "activated_Date": activatedDate!.toIso8601String(),
    "exp_Date": expDate!.toIso8601String(),
    "sms_Banking": smsBanking,
    "u_ID": uId,
    "refreshTokens": List<dynamic>.from(refreshTokens!.map((x) => x)),
  };
}
