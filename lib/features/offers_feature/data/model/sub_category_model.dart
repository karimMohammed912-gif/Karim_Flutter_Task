class SubCategoryModel {
  final int? id;
  final String title;
  final String imageUrl;

  SubCategoryModel({this.id, required this.title, required this.imageUrl});

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      id: map['id'] as int?,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id, 'title': title, 'imageUrl': imageUrl};
  }
}
