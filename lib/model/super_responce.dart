class SuperResponce<T> {
  String success;
  String message;
  String statusCode;
  T data;

  SuperResponce(
      {this.success,
        this.message,
        this.statusCode,
      this.data});

  SuperResponce.fromJson(Map<String, dynamic> json, T t) {
    success = json["success"];
    message = json["message"];
    statusCode = json["status_code"];
    data = t;
  }
}
