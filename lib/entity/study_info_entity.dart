class StudyInfoEntity {
	List<StudyInfoData> data;
	int errorCode;
	String errorMsg;

	StudyInfoEntity({this.data, this.errorCode, this.errorMsg});

	StudyInfoEntity.fromJson(Map<String, dynamic> json) {
		if (json['data'] != null) {
			data = new List<StudyInfoData>();
			(json['data'] as List).forEach((v) { data.add(new StudyInfoData.fromJson(v)); });
		}
		errorCode = json['errorCode'];
		errorMsg = json['errorMsg'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
		data['errorCode'] = this.errorCode;
		data['errorMsg'] = this.errorMsg;
		return data;
	}
}

class StudyInfoData {
	int visible;
	List<StudyInfoDataChild> children;
	String name;
	bool userControlSetTop;
	int id;
	int courseId;
	int parentChapterId;
	int order;

	StudyInfoData({this.visible, this.children, this.name, this.userControlSetTop, this.id, this.courseId, this.parentChapterId, this.order});

	StudyInfoData.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<StudyInfoDataChild>();
			(json['children'] as List).forEach((v) { children.add(new StudyInfoDataChild.fromJson(v)); });
		}
		name = json['name'];
		userControlSetTop = json['userControlSetTop'];
		id = json['id'];
		courseId = json['courseId'];
		parentChapterId = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.userControlSetTop;
		data['id'] = this.id;
		data['courseId'] = this.courseId;
		data['parentChapterId'] = this.parentChapterId;
		data['order'] = this.order;
		return data;
	}
}

class StudyInfoDataChild {
	int visible;
	List<Object> children;
	String name;
	bool userControlSetTop;
	int id;
	int courseId;
	int parentChapterId;
	int order;

	StudyInfoDataChild({this.visible, this.children, this.name, this.userControlSetTop, this.id, this.courseId, this.parentChapterId, this.order});

	StudyInfoDataChild.fromJson(Map<String, dynamic> json) {
		visible = json['visible'];
		if (json['children'] != null) {
			children = new List<Object>();
			(json['children'] as List).forEach((v) { children.add(new Object()); });
		}
		name = json['name'];
		userControlSetTop = json['userControlSetTop'];
		id = json['id'];
		courseId = json['courseId'];
		parentChapterId = json['parentChapterId'];
		order = json['order'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['visible'] = this.visible;
		if (this.children != null) {
      data['children'] = this.children.map((v) => v).toList();
    }
		data['name'] = this.name;
		data['userControlSetTop'] = this.userControlSetTop;
		data['id'] = this.id;
		data['courseId'] = this.courseId;
		data['parentChapterId'] = this.parentChapterId;
		data['order'] = this.order;
		return data;
	}
}
