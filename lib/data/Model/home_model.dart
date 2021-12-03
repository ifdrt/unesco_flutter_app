import 'package:unesco/data/dataProvider/main_info.dart';

class HomeModel {
  List<SlidersModel>? slidersModel;
  AboutsModel? aboutsModel;
  List<PurposesModel>? purposesModel;
  List<ArticlesModel>? articlesModel;

  HomeModel(
      {this.slidersModel,
      this.aboutsModel,
      this.purposesModel,
      this.articlesModel});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      slidersModel = [];
      json['sliders'].forEach((v) {
        slidersModel?.add(new SlidersModel.fromJson(v));
      });
    }
    aboutsModel = json['abouts'] != null
        ? new AboutsModel.fromJson(json['abouts'])
        : null;
    if (json['purposes'] != null) {
      purposesModel = [];
      json['purposes'].forEach((v) {
        purposesModel?.add(new PurposesModel.fromJson(v));
      });
    }
    if (json['articles'] != null) {
      articlesModel = [];
      json['articles'].forEach((v) {
        articlesModel?.add(new ArticlesModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slidersModel != null) {
      data['SlidersModel'] = this.slidersModel?.map((v) => v.toJson()).toList();
    }
    if (this.aboutsModel != null) {
      data['AboutsModel'] = this.aboutsModel?.toJson();
    }
    if (this.purposesModel != null) {
      data['PurposesModel'] =
          this.purposesModel?.map((v) => v.toJson()).toList();
    }
    if (this.articlesModel != null) {
      data['ArticlesModel'] =
          this.articlesModel?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SlidersModel {
  int? id;
  String? title;
  String? description;
  String? photo;
  String? buttonTitle;
  String? buttonLink;
  String? createdAt;
  String? updatedAt;

  SlidersModel(
      {this.id,
      this.title,
      this.description,
      this.photo,
      this.buttonTitle,
      this.buttonLink,
      this.createdAt,
      this.updatedAt});

  SlidersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    photo = Info.host + "/storage/" + json['photo'];
    buttonTitle = json['button_title'];
    buttonLink = json['button_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['button_title'] = this.buttonTitle;
    data['button_link'] = this.buttonLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AboutsModel {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? photo;
  String? createdAt;
  String? updatedAt;

  AboutsModel(
      {this.id,
      this.title,
      this.shortDescription,
      this.longDescription,
      this.photo,
      this.createdAt,
      this.updatedAt});

  AboutsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    photo = Info.host + "/storage/" + json['photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['photo'] = this.photo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PurposesModel {
  int? id;
  String? title;
  String? icon;
  String? desciption;
  String? createdAt;
  String? updatedAt;

  PurposesModel(
      {this.id,
      this.title,
      this.icon,
      this.desciption,
      this.createdAt,
      this.updatedAt});

  PurposesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    desciption = json['desciption'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['desciption'] = this.desciption;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ArticlesModel {
  String? title;
  String? catKey;
  String? photo;
  String? slug;
  String? shortDescription;
  String? createdAt;
  String? longDescription;
  String? catName;

  ArticlesModel(
      {this.title,
      this.catKey,
      this.photo,
      this.slug,
      this.shortDescription,
      this.createdAt,
      this.longDescription,
      this.catName});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    catKey = json['cat_key'];
    photo = Info.host + "/storage/" + json['photo'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    createdAt = json['created_at'];
    longDescription = json['long_description'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['cat_key'] = this.catKey;
    data['photo'] = this.photo;
    data['slug'] = this.slug;
    data['short_description'] = this.shortDescription;
    data['created_at'] = this.createdAt;
    data['long_description'] = this.longDescription;
    data['cat_name'] = this.catName;
    return data;
  }
}
