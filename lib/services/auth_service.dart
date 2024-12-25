
import 'package:recip_book_app/services/networking/http_services.dart';

class AuthService {
  static final AuthService _singleton = AuthService._internal();

  final _httpService = HTTPservice();

  factory AuthService(){
    return _singleton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async {
   try{
     var response = await _httpService.post("auth/login", {
       "username": username,
       "password" : password,
     });
     if(response?.statusCode == 200 && response?.data != null){
       print(response! . data);
     }
   } catch (e){
     print(e);
   }
   return false;
  }

}