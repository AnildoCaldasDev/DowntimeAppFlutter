class ChatStructureModel {
  String from;
  String message;

  ChatStructureModel({this.from, this.message});

  ChatStructureModel.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from'] = this.from;
    data['message'] = this.message;
    return data;
  }
}
