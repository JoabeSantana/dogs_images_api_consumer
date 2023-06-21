import 'package:dogs_images_api_consumer/models/dimension.dart';

class Height extends Dimension {
  Height({required super.imperial, required super.metric});

  factory Height.fromJson(Map<String, dynamic> json) {
    return Height(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}