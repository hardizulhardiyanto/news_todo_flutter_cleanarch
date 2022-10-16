class DashboardAllTaskEntityResponse {
  DashboardAllTaskEntityResponse({
    this.count,
    this.data,
  });

  int? count;
  List<DatumEntity>? data;
}

class DatumEntity {
  DatumEntity({
    this.completed,
    this.id,
    this.description,
    this.owner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool? completed;
  String? id;
  String? description;
  String? owner;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
}
