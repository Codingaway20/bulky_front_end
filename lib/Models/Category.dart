// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  int Id = -1;
  String Name = "";
  int DisplayOrder = -1;

  Category({
    required this.Id,
    required this.Name,
    required this.DisplayOrder,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': Id == null ? 0.toString() : Id.toString(),
      'name': Name,
      'displayOrder': DisplayOrder,
    };
  }

  Category.fromObject(dynamic obj) {
    this.Id = obj["id"] ?? -1;
    this.Name = obj["name"] ?? "null";
    this.DisplayOrder = obj["displayOrder"] ?? 0;
  }
}
