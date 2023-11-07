class CineclubResponse {
    final int id;
    final String name;
    final String socialReason;
    final String ruc;
    final String phone;
    final String? logoSrc;
    final String? bannerSrc;
    final String? description;
    final String address;
    final String? state;
    final int? capacity;
    final String? openingHours;
    final User user;
    final BusinessType businessType;

    CineclubResponse({
        required this.id,
        required this.name,
        required this.socialReason,
        required this.ruc,
        required this.phone,
        required this.logoSrc,
        required this.bannerSrc,
        required this.description,
        required this.address,
        required this.state,
        required this.capacity,
        required this.openingHours,
        required this.user,
        required this.businessType,
    });

    factory CineclubResponse.fromJson(Map<String, dynamic> json) => CineclubResponse(
        id: json["id"],
        name: json["name"],
        socialReason: json["socialReason"],
        ruc: json["ruc"],
        phone: json["phone"],
        logoSrc: json["logoSrc"],
        bannerSrc: json["bannerSrc"],
        description: json["description"],
        address: json["address"],
        state: json["state"],
        capacity: json["capacity"],
        openingHours: json["openingHours"],
        user: User.fromJson(json["user"]),
        businessType: BusinessType.fromJson(json["businessType"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "socialReason": socialReason,
        "ruc": ruc,
        "phone": phone,
        "logoSrc": logoSrc,
        "bannerSrc": bannerSrc,
        "description": description,
        "address": address,
        "state": state,
        "capacity": capacity,
        "openingHours": openingHours,
        "user": user.toJson(),
        "businessType": businessType.toJson(),
    };
}

class BusinessType {
    final int id;
    final String name;

    BusinessType({
        required this.id,
        required this.name,
    });

    factory BusinessType.fromJson(Map<String, dynamic> json) => BusinessType(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class User {
    final int id;
    final String firstName;
    final String lastName;
    final DateTime birthdate;
    final String phone;
    final String email;
    final DateTime createdAt;
    final String dni;
    final String password;
    final dynamic imageSrc;
    final dynamic bankAccount;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.birthdate,
        required this.phone,
        required this.email,
        required this.createdAt,
        required this.dni,
        required this.password,
        required this.imageSrc,
        required this.bankAccount,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthdate: DateTime.parse(json["birthdate"]),
        phone: json["phone"],
        email: json["email"],
        createdAt: DateTime.parse(json["createdAt"]),
        dni: json["dni"],
        password: json["password"],
        imageSrc: json["imageSrc"],
        bankAccount: json["bankAccount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "email": email,
        "createdAt": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "dni": dni,
        "password": password,
        "imageSrc": imageSrc,
        "bankAccount": bankAccount,
    };
}
