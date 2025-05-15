class CollectionModel {
  final String? id;
  final String? title;
  final String? handle;
  final String? description;
  final String? descriptionHtml;
  final String? onlineStoreUrl;
  final String? trackingParameters;
  final String? updatedAt;

  CollectionModel({
    required this.id,
    required this.title,
    required this.handle,
    required this.description,
    required this.descriptionHtml,
    required this.onlineStoreUrl,
    required this.trackingParameters,
    required this.updatedAt,
  });

  factory CollectionModel.fromJson(Map<String, dynamic> json) {
    return CollectionModel(
      id: json['id'],
      title: json['title'],
      handle: json['handle'],
      description: json['description'],
      descriptionHtml: json['descriptionHtml'],
      onlineStoreUrl: json['onlineStoreUrl'],
      trackingParameters: json['trackingParameters'],
      updatedAt: json['updatedAt'],
    );
  }
}
