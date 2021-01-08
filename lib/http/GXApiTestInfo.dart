class GXApiTestInfo {
  bool isLogin;

  GXApiTestInfo({this.isLogin});

  factory GXApiTestInfo.fromJson(Map<String, dynamic> json) {
    return GXApiTestInfo(
      isLogin: json['isLogin'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLogin'] = this.isLogin;
    return data;
  }
}