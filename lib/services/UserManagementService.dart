import '../display/alertBoxes/ResultAlertBox.dart';
import '../models/Citizen.dart';


abstract class UserManagementService {


  static ResultAlertBox signUp(Citizen citizen){
    return ResultAlertBox();
  }


  static dynamic login(String username, String password){

  }

  static dynamic googleLogin(){}

  static dynamic facebookLogin(){}


  static dynamic logout(){}
  static dynamic logoutAllSessions(){}
  static dynamic logoutAllOtherSessions(){}



  static dynamic confirmAccount(String code){}

  static ResultAlertBox manageTwoFactorAuth(){
    return ResultAlertBox();
  }

  static dynamic twoFactorAuth(String code){}
  static dynamic requestPasswordReset(Citizen citizen){}
  static dynamic resetPassword(String username){}
  static dynamic changePassword(String token){}
}