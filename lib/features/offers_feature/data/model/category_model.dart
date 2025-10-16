class CategoryModel {
  final int? id;
  final String title;

  CategoryModel({this.id, required this.title});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      title: map['title'] as String,

    );
  }

  Map<String, dynamic> toMap() {
    return {if (id != null) 'id': id, 'title': title,};
  }
}
