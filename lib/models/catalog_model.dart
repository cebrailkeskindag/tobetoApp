class CatalogModel {
 
  const CatalogModel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.time,
    required this.title,
  });

  final String id;
  final String name;
  final String time;
  final String title;
  final String imagePath;
}
