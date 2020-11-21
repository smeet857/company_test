class Sku {
  String id;
  String sku;
  String name;

  Sku({this.id, this.sku, this.name});

  Sku.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sku = json['sku'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sku'] = this.sku;
    data['name'] = this.name;
    return data;
  }
}