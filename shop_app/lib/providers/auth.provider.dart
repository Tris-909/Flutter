import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String token;
  DateTime expiryTime;
  String userId;

  bool get isAuthenticated {
    return !(checkToken == null);
  }

  String get checkToken {
    if (expiryTime != null && expiryTime.isAfter(DateTime.now())) {
      return token;
    }
    return null;
  }

  Future<void> signup(String email, String password) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAhAr6kN40ri8hi7s-7LGkoDOuj_i0Y8fk');

      final responses = await http.post(
        url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }),
      );

      final decodedResponse = json.decode(responses.body);

      if (decodedResponse['error'] != null) {
        throw Exception(decodedResponse['error']['message']);
      } else {
        token = decodedResponse['idToken'];
        expiryTime = DateTime.now()
            .add(Duration(seconds: int.parse(decodedResponse['expiresIn'])));
        userId = decodedResponse['localId'];
      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signin(String email, String password) async {
    try {
      final url = Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAhAr6kN40ri8hi7s-7LGkoDOuj_i0Y8fk');

      final responses = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));

      final decodedResponse = json.decode(responses.body);

      if (decodedResponse['errors'] != null) {
        throw Exception(decodedResponse['errors']['message']);
      } else {
        token = decodedResponse['idToken'];
        expiryTime = DateTime.now()
            .add(Duration(seconds: int.parse(decodedResponse['expiresIn'])));
        userId = decodedResponse['localId'];
      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
