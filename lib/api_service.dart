import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Apidog> randomDog() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    var response = await http.get(Uri.parse(url));
    var map = jsonDecode(response.body);
    Apidog msg = Apidog.fromJson(map);
    print("URL image = " + msg.message);
    return msg;
  }
}

Apidog apidogFromJson(String str) => Apidog.fromJson(json.decode(str));

String apidogToJson(Apidog data) => json.encode(data.toJson());

class Apidog {
  Apidog({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory Apidog.fromJson(Map<String, dynamic> json) => Apidog(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
