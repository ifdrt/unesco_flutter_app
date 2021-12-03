class InfoModel {
  List<ReportTypes>? reportTypes;
  List<Questions>? questions;
  List<String>? nationality;
  List<String>? status;
  List<String>? religion;
  List<String>? nationalism;

  InfoModel(
      {this.reportTypes,
      this.questions,
      this.nationality,
      this.status,
      this.religion,
      this.nationalism});

  InfoModel.fromJson(Map<String, dynamic> json) {
    if (json['report_types'] != null) {
      reportTypes = [];
      json['report_types'].forEach((v) {
        reportTypes?.add(new ReportTypes.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((v) {
        questions?.add(new Questions.fromJson(v));
      });
    }
    nationality = json['nationality'].cast<String>();
    status = json['status'].cast<String>();
    religion = json['religion'].cast<String>();
    nationalism = json['nationalism'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reportTypes != null) {
      data['report_types'] = this.reportTypes?.map((v) => v.toJson()).toList();
    }
    if (this.questions != null) {
      data['questions'] = this.questions?.map((v) => v.toJson()).toList();
    }
    data['nationality'] = this.nationality;
    data['status'] = this.status;
    data['religion'] = this.religion;
    data['nationalism'] = this.nationalism;
    return data;
  }
}

class ReportTypes {
  int? id;
  String? title;
  String? createdAt;
  String? updatedAt;

  ReportTypes({this.id, this.title, this.createdAt, this.updatedAt});

  ReportTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Questions {
  int? id;
  String? name;
  String? title;
  dynamic notes;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
      this.name,
      this.title,
      this.notes,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    notes = json['notes'] ?? -1;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
