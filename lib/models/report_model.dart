import 'package:intl/intl.dart';

class ReportModel {
    ReportModel({
        this.id,
        this.location,
        this.state,
        this.district,
        this.type,
        this.description,
        this.image,
        this.user,
        this.created_at,
    });

    String id;
    LocationModel location;
    String state;
    String district;
    String type;
    String description;
    ImageModel image;
    String user;
    String created_at;

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json["_id"],
        location: LocationModel.fromJson(json["location"]),
        district: json["district"],
        state: json["state"],
        type: json["type"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        user: json["user"],
        created_at: DateFormat().format(DateTime.parse(json["created_at"]).toLocal()),
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "location": location.toJson(),
        "district": district,
        "state": state,
        "type": type,
        "description": description == null ? null : description,
        "image": image == null ? null : image.toJson(),
        "user": user == null ? null : user,
    };
}

class ImageModel {
    ImageModel({
        this.id,
        this.data,
        this.contentType,
    });

    String id;
    String data;
    String contentType;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["_id"],
        data: json["data"],
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "data": data,
        "contentType": contentType,
    };
}

class LocationModel {
    LocationModel({
        this.coordinates,
        this.id,
        this.type,
        this.description,
    });

    List<double> coordinates;
    String id;
    String type;
    String description;

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
        id: json["_id"],
        type: json["type"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "type": type,
        "description": description,
    };
}
