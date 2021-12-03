import 'package:unesco/data/Model/home_model.dart';

class NewsModel {
  List<ArticlesModel>? dataNews;

  NewsModel({this.dataNews});

  NewsModel.fromJson(Map<String?, dynamic> json) {
    if (json['data_news'] != null) {
      dataNews = [];
      json['data_news'].forEach((v) {
        dataNews?.add(new ArticlesModel.fromJson(v));
      });
    }
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    if (this.dataNews != null) {
      data['data_news'] = this.dataNews?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataNews {
  String? title;
  String? catKey;
  String? photo;
  String? slug;
  String? shortDescription;
  String? createdAt;
  String? longDescription;
  String? catName;

  DataNews(
      {this.title,
      this.catKey,
      this.photo,
      this.slug,
      this.shortDescription,
      this.createdAt,
      this.longDescription,
      this.catName});

  DataNews.fromJson(Map<String?, dynamic> json) {
    title = json['title'];
    catKey = json['cat_key'];
    photo = json['photo'];
    slug = json['slug'];
    shortDescription = json['short_description'];
    createdAt = json['created_at'];
    longDescription = json['long_description'];
    catName = json['cat_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
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
