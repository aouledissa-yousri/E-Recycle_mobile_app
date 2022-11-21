import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/AccountSettingsPage.dart';
import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/MakeRecycleRequestPage.dart';
import 'package:flutter/material.dart';
import 'CitizenRecycleRequestPage.dart';
import 'NotificationsPage.dart';


class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  int _currentIndex = 0;
  Widget currentPage = CitizenRecycleRequestPage();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 8, 221, 193),
        fixedColor: Colors.white,
        currentIndex: this._currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Recycle request list"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Make recycle request"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],

        onTap: (index) {
          setCurrentIndex(index);
          changePage(index);
        },
      ),

    );
  }


  void setCurrentIndex(int index) {
    setState(() => this._currentIndex = index);
  }


  void changePage(int index){
    switch(index){

      case 0: 
        this.recycleRequestList();
        return;
      
      case 1: 
        this.makeRecycleRequest();
        return;

      case 2: 
        this.notifications();
        return;
      
      case 3: 
        this.accountSettings();
        return;

    }
  }



  void recycleRequestList(){
    setState(() => this.currentPage = CitizenRecycleRequestPage());
  }

  void makeRecycleRequest(){
    setState(() => this.currentPage = MakeRecycleRequestPage());
  }

  void notifications(){
    setState(() => this.currentPage = NotificationsPage());
  }

  void accountSettings(){
    setState(() => this.currentPage = AccountSettingsPage());
  }
}