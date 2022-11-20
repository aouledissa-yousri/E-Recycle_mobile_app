import 'package:e_recycle_mobile_app/models/User.dart';


class GenericUser extends User {

  String _username = "";
  String _email = "";

  GenericUser(String username, String email){
    this._username = username;
    this._email = email;
  }

  String getUsername(){
    return this._username;
  }

  String getEmail(){
    return this._email;
  }

  void setUsername(String username){
    this._username = username;
  }

  void setEmail(String email){
    this._email = email;
  }
  


}