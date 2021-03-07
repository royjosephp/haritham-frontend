// To parse this JSON data, do
//
//     final welcome = User.fromJson(json.decode(str));

class User {
    User({
        this.inactive,
        this.id,
        this.phone,
        this.v,
    });

    bool inactive;
    String id;
    String phone;
    int v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        inactive: json["inactive"],
        id: json["_id"],
        phone: json["phone"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "inactive": inactive,
        "_id": id,
        "phone": phone,
        "__v": v,
    };
}
