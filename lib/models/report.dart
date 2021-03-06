
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
        this.v,
    });

    String id;
    LocationModel location;
    String state;
    String district;
    String type;
    String description;
    ImageModel image;
    String user;
    int v;

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        id: json["_id"],
        location: LocationModel.fromJson(json["location"]),
        state: json["state"],
        district: json["district"],
        type: json["type"],
        description: json["description"] == null ? null : json["description"],
        image: json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        user: json["user"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "location": location.toJson(),
        "state": state,
        "district": district,
        "type": type,
        "description": description,
        "image": image.toJson(),
        "user": user,
        "__v": v,
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

    List<int> coordinates;
    String id;
    String type;
    String description;

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        coordinates: List<int>.from(json["coordinates"].map((x) => x)),
        id: json["_id"],
        type: json["type"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
        "_id": id,
        "type": type,
        "description": description,
    };
}
