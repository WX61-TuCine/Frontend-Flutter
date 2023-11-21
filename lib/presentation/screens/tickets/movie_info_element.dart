import 'dart:convert';
import 'dart:math';

List<Ticket> ticketFromJson(String str) => List<Ticket>.from(json.decode(str).map((x) => Ticket.fromJson(x)));

class Ticket {
  final int id;
  final int numberSeats;
  final double totalPrice;
  final String status;
  final DateTime dateEmition;
  final User user;
  final int showtimeId;
  final String state;

  Ticket({
    required this.id,
    required this.numberSeats,
    required this.totalPrice,
    required this.status,
    required this.dateEmition,
    required this.user,
    required this.showtimeId,
    required this.state
  });
/*
  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    numberSeats: json["numberSeats"],
    totalPrice: json["totalPrice"]?.toDouble(),
    status: json["status"],
    dateEmition: DateTime.parse(json["dateEmition"]),
    user: User.fromJson(json["user"]),
    showtimeId: json["showtime"]["id"],
    state: "proximo"
  );*/
  factory Ticket.fromJson(Map<String, dynamic> json) {
    final List<String> estados = ["proximo", "pasado", "cancelado"];
    final int indiceAleatorio = Random().nextInt(estados.length);
    final String estadoAleatorio = estados[indiceAleatorio];

    return Ticket(
      id: json["id"],
      numberSeats: json["numberSeats"],
      totalPrice: json["totalPrice"]?.toDouble(),
      status: json["status"],
      dateEmition: DateTime.parse(json["dateEmition"]),
      user: User.fromJson(json["user"]),
      showtimeId: json["showtime"]["id"],
      state: estadoAleatorio,
    );
  }

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

//Showtimes
List<Showtime> showtimeFromJson(String str) => List<Showtime>.from(json.decode(str).map((x) => Showtime.fromJson(x)));

class Showtime {
  final int id;
  final String playDate;
  final String playTime;
  final int capacity;
  final double unitPrice;
  final int availableFilmId;

  Showtime({
    required this.id,
    required this.playDate,
    required this.playTime,
    required this.capacity,
    required this.unitPrice,
    required this.availableFilmId,
  });

  factory Showtime.fromJson(Map<String, dynamic> json) => Showtime(
    id: json["id"],
    playDate: json["playDate"],
    playTime: json["playTime"],
    capacity: json["capacity"],
    unitPrice: json["unitPrice"]?.toDouble(),
    availableFilmId: json["availableFilm"]["id"],
  );
}

//AvailableFilm

List<AvailableFilm> availableFilmFromJson(String str) => List<AvailableFilm>.from(json.decode(str).map((x) => AvailableFilm.fromJson(x)));

class AvailableFilm {
  final int id;
  final Business business;
  final Film film;
  final String customNotice;
  final String isAvailable;
  final Promotion promotion;

  AvailableFilm({
    required this.id,
    required this.business,
    required this.film,
    required this.customNotice,
    required this.isAvailable,
    required this.promotion,
  });

  factory AvailableFilm.fromJson(Map<String, dynamic> json) => AvailableFilm(
    id: json["id"],
    business: Business.fromJson(json["business"]),
    film: Film.fromJson(json["film"]),
    customNotice: json["customNotice"],
    isAvailable: json["isAvailable"],
    promotion: Promotion.fromJson(json["promotion"]),
  );
}

class Business {
  final int id;
  final String name;
  final String socialReason;
  final String ruc;
  final String phone;
  final String logoSrc;
  final String bannerSrc;
  final String description;
  final String address;
  final String state;
  final int capacity;
  final String openingHours;
  final BusinessType businessType;

  Business({
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
    required this.businessType,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
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

class Film {
  final int id;
  final String title;
  final int year;
  final String synopsis;
  final String posterSrc;
  final String trailerSrc;
  final int duration;

  Film({
    required this.id,
    required this.title,
    required this.year,
    required this.synopsis,
    required this.posterSrc,
    required this.trailerSrc,
    required this.duration,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    id: json["id"],
    title: json["title"],
    year: json["year"],
    synopsis: json["synopsis"],
    posterSrc: json["posterSrc"],
    trailerSrc: json["trailerSrc"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "year": year,
    "synopsis": synopsis,
    "posterSrc": posterSrc,
    "trailerSrc": trailerSrc,
    "duration": duration,
  };
}

class Promotion {
  final int id;
  final String title;
  final String startDate;
  final String endDate;
  final String description;
  final String imageSrc;
  final double discount;

  Promotion({
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.imageSrc,
    required this.discount,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    id: json["id"],
    title: json["title"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    description: json["description"],
    imageSrc: json["imageSrc"],
    discount: json["discount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "startDate": startDate,
    "endDate": endDate,
    "description": description,
    "imageSrc": imageSrc,
    "discount": discount,
  };
}
