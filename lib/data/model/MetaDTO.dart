import 'package:route_tech_summit_task/domain/model/Meta.dart';

/// createdAt : "2024-05-23T08:56:21.618Z"
/// updatedAt : "2024-05-23T08:56:21.618Z"
/// barcode : "9164035109868"
/// qrCode : "https://assets.dummyjson.com/public/qr-code.png"

class MetaDTO {
  MetaDTO({
      this.createdAt, 
      this.updatedAt, 
      this.barcode, 
      this.qrCode,});

  MetaDTO.fromJson(dynamic json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    barcode = json['barcode'];
    qrCode = json['qrCode'];
  }
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['barcode'] = barcode;
    map['qrCode'] = qrCode;
    return map;
  }
  Meta toDomainMeta(){
    return Meta(
      barcode:barcode ,
      createdAt:createdAt ,
      qrCode:qrCode ,

      updatedAt: updatedAt,
    );
  }
}