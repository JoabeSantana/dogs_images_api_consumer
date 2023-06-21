import 'package:dogs_images_api_consumer/models/dimension.dart';

class Weight extends Dimension {
  
  Weight({required super.imperial, required super.metric});

  factory Weight.fromJson(Map<String, dynamic> json) {
    return Weight(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}