class Country {
  final int id;
  final String name;

  Country({
    required this.id,
    required this.name,
  });

  static final List<Country> choises = [
    Country(id: 1, name: "us"),
    Country(id: 2, name: "ar"),
    Country(id: 3, name: "br"),
    Country(id: 4, name: "fr"),
    Country(id: 5, name: "ru"),
    Country(id: 6, name: "eg"),
    Country(id: 7, name: "ua"),
  ];
}
