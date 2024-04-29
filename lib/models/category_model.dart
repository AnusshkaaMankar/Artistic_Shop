// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<Category> categories;

    CategoryModel({
        required this.categories,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    String name;
    List<SubCategory> subCategory;

    Category({
        required this.name,
        required this.subCategory,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        subCategory: List<SubCategory>.from(json["subCategory"].map((x) => subCategoryValues.map[x])),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "subCategory": List<dynamic>.from(subCategory.map((x) => subCategoryValues.reverse[x])),
    };
}

enum SubCategory {
    SAND,
    WOOD
}

final subCategoryValues = EnumValues({
    "Sand": SubCategory.SAND,
    "Wood": SubCategory.WOOD
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
