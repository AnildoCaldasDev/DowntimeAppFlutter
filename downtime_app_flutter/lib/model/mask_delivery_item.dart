class MaskDeliveryItem {
  String userid;
  String dateDelivery;

  MaskDeliveryItem({this.userid, this.dateDelivery});

  MaskDeliveryItem.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    dateDelivery = json['dateDelivery'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['dateDelivery'] = this.dateDelivery;
    return data;
  }
}
