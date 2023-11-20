import 'dart:convert';

List<Ticket> ticketFromJson(String str) => List<Ticket>.from(json.decode(str).map((x) => Ticket.fromJson(x)));
String ticketToJson(List<Ticket> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ticket {
  final int id;
  final int numberSeats;
  final double totalPrice;
  final String status;
  final DateTime dateEmition;
  final User user;
  final Showtime showtime;
  final String state;

  Ticket({
    required this.id,
    required this.numberSeats,
    required this.totalPrice,
    required this.status,
    required this.dateEmition,
    required this.user,
    required this.showtime,
    required this.state
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json["id"],
    numberSeats: json["numberSeats"],
    totalPrice: json["totalPrice"]?.toDouble(),
    status: json["status"],
    dateEmition: DateTime.parse(json["dateEmition"]),
    user: User.fromJson(json["user"]),
    showtime: Showtime.fromJson(json["showtime"]),
    state: "proximo"
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "numberSeats": numberSeats,
    "totalPrice": totalPrice,
    "status": status,
    "dateEmition": "${dateEmition.year.toString().padLeft(4, '0')}-${dateEmition.month.toString().padLeft(2, '0')}-${dateEmition.day.toString().padLeft(2, '0')}",
    "user": user.toJson(),
    "showtime": showtime.toJson(),
  };
}

class Showtime {
  final int id;
  final String playDate;
  final String playTime;
  final int capacity;
  final double unitPrice;
  //final int unitPrice;

  Showtime({
    required this.id,
    required this.playDate,
    required this.playTime,
    required this.capacity,
    required this.unitPrice,
  });

  factory Showtime.fromJson(Map<String, dynamic> json) => Showtime(
    id: json["id"],
    playDate: json["playDate"],
    playTime: json["playTime"],
    capacity: json["capacity"],
    unitPrice: json["unitPrice"]?.toDouble(),
    //unitPrice: json["unitPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "playDate": playDate,
    "playTime": playTime,
    "capacity": capacity,
    "unitPrice": unitPrice,
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
