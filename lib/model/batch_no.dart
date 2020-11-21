class Batch {
  String id;
  String manufacturingDate;
  String expiryDate;
  String batchNo;
  String productId;

  Batch(
      {this.id,
        this.manufacturingDate,
        this.expiryDate,
        this.batchNo,
        this.productId});

  Batch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    manufacturingDate = json['manufacturing_date'];
    expiryDate = json['expiry_date'];
    batchNo = json['batch_no'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['manufacturing_date'] = this.manufacturingDate;
    data['expiry_date'] = this.expiryDate;
    data['batch_no'] = this.batchNo;
    data['product_id'] = this.productId;
    return data;
  }
}