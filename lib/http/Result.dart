import 'package:gx_flutter/common/JsonToBeanFactory.dart';

class Result<T> {
    T data;
    Status status;
    int systemDate;

    Result({this.data, this.status, this.systemDate});

    factory Result.fromJson(Map<String, dynamic> json) {

        return Result(
            data: json['data'] != null ? JsonToBeanFactory.fromJson<T>(json['data']) : null,
            status: json['status'] != null ? Status.fromJson(json['status']) : null,
            systemDate: json['systemDate'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['data'] = this.data;
        data['systemDate'] = this.systemDate;
        if (this.status != null) {
            data['status'] = this.status.toJson();
        }
        return data;
    }
}

class Status {
    int code;
    String message;

    Status({this.code, this.message});

    factory Status.fromJson(Map<String, dynamic> json) {
        return Status(
            code: json['code'],
            message: json['message'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['code'] = this.code;
        data['message'] = this.message;
        return data;
    }
}