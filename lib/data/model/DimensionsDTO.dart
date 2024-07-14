import 'package:route_tech_summit_task/domain/model/Dimensions.dart';

/// width : 23.17
/// height : 14.43
/// depth : 28.01

class DimensionsDTO {
  DimensionsDTO({
      this.width, 
      this.height, 
      this.depth,});

  DimensionsDTO.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  num? width;
  num? height;
  num? depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }
  Dimensions toDomainDimension()
  {
    return Dimensions(
      width: width,
      height: height,
      depth: depth,
    );
  }

}