import 'dart:io';

import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/CitizenLoginPage.dart';
import 'package:e_recycle_mobile_app/display/pages/nonAuthPages/LandingPage.dart';
import 'package:e_recycle_mobile_app/helpers/DirectoryHelper.dart';
import 'package:e_recycle_mobile_app/services/UserManagementService.dart';
import 'package:flutter/material.dart';


class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {

  late Map<String, dynamic> userData = Map<String, dynamic>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadUserData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: ListView(
        children: [
          Text(userData["user"]["name"] + " " + userData["user"]["lastname"], textAlign: TextAlign.center, style: TextStyle(fontSize: 30)),
          Text("  \n   "),
          ListTile(
            leading: Text("Log out"),
            trailing: IconButton(
                icon: Icon(Icons.logout, color: Color.fromARGB(255, 8, 221, 193)),
                onPressed: () => logout()
              ),
          ),

          Divider(color: Color.fromARGB(255, 39, 39, 39), endIndent: 16, indent: 16),

          ListTile(
            leading: Text("Log out from all sessions"),
            trailing: IconButton(
                icon: Icon(Icons.logout, color: Color.fromARGB(255, 8, 221, 193)),
                onPressed: () => logoutAllSessions()
              ),
          ),

          Divider(color: Color.fromARGB(255, 39, 39, 39), endIndent: 16, indent: 16),

          ListTile(
            leading: Text("Log out from all other sessions"),
            trailing: IconButton(
                icon: Icon(Icons.logout, color: Color.fromARGB(255, 8, 221, 193)),
                onPressed: () => logoutAllOtherSessions()
              ),
          ),

          Divider(color: Color.fromARGB(255, 39, 39, 39), endIndent: 16, indent: 16),


        ],
      )
    );
  }


  Future<void> loadUserData() async{
    dynamic userData = await DirectoryHelper.getUserData();
    setState(() { this.userData = userData; });
  }


  logout(){
    UserManagementService.logout(userData["token"]);
    DirectoryHelper.deleteUserData();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  logoutAllSessions(){
    UserManagementService.logoutAllSessions(userData["token"]);
    DirectoryHelper.deleteUserData();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  logoutAllOtherSessions(){
    UserManagementService.logoutAllOtherSessions(userData["token"]);
    DirectoryHelper.deleteUserData();
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => LandingPage()));
  }
}