
class Report {
    Report({
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
    Location location;
    String state;
    String district;
    String type;
    String description;
    Image image;
    String user;
    int v;

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        id: json["_id"],
        location: Location.fromJson(json["location"]),
        state: json["state"],
        district: json["district"],
        type: json["type"],
        description: json["description"],
        image: Image.fromJson(json["image"]),
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

class Image {
    Image({
        this.id,
        this.data,
        this.contentType,
    });

    String id;
    Data data;
    String contentType;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["_id"],
        data: Data.fromJson(json["data"]),
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "data": data.toJson(),
        "contentType": contentType,
    };
}

class Data {
    Data({
        this.type,
        this.data,
    });

    String type;
    List<int> data;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"],
        data: List<int>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}

class Location {
    Location({
        this.coordinates,
        this.id,
        this.type,
        this.description,
    });

    List<int> coordinates;
    String id;
    String type;
    String description;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
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
