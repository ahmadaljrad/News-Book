class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  static final List<Category> choises = [
    Category(id: 1, name: "business"),
    Category(id: 2, name: "entertainment"),
    Category(id: 3, name: "general"),
    Category(id: 4, name: "health"),
    Category(id: 5, name: "science"),
    Category(id: 6, name: "sports"),
    Category(id: 7, name: "technology"),
  ];
}
