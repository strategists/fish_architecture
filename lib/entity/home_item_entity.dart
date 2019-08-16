class HomeItemEntity {
  List<HomeItemData> data;

  HomeItemEntity({this.data});

  HomeItemEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<HomeItemData>();
      (json['data'] as List).forEach((v) {
        data.add(new HomeItemData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeItemData {
  String limitValue = "";
  bool isPutaway = false;
  String limitLabel = "";
  List<String> label = [];
  String title = "";
  String buttonText = "";

  HomeItemData(
      {this.limitValue,
      this.isPutaway,
      this.limitLabel,
      this.label,
      this.title});

  HomeItemData.fromJson(Map<String, dynamic> json) {
    limitValue = json['limitValue'];
    isPutaway = json['isPutaway'];
    limitLabel = json['limitLabel'];
    label = json['label'].cast<String>();
    title = json['title'];
    buttonText = json['buttonText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limitValue'] = this.limitValue;
    data['isPutaway'] = this.isPutaway;
    data['limitLabel'] = this.limitLabel;
    data['label'] = this.label;
    data['title'] = this.title;
    data['buttonText'] = this.buttonText;
    return data;
  }
}
