class ProfileEntity {
	List<PreferenceItem> data;

	ProfileEntity({this.data});

	ProfileEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<PreferenceItem>();
			(json['data'] as List).forEach((v) { data.add(new PreferenceItem.fromJson(v)); });
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

class PreferenceItem {
	bool isGroupHeader;
	dynamic icon;
	String text;
	bool isGroup;

	PreferenceItem({this.isGroupHeader = false, this.icon, this.text, this.isGroup = false});

	PreferenceItem.fromJson(Map<String, dynamic> json) {
		isGroupHeader = json['isGroupHeader'];
		icon = json['icon'];
		text = json['text'];
		isGroup = json['isGroup'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['isGroupHeader'] = this.isGroupHeader;
		data['icon'] = this.icon;
		data['text'] = this.text;
		data['isGroup'] = this.isGroup;
		return data;
	}
}
