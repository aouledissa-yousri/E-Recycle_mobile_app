import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/AccountSettingsPage.dart';
import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/MakeRecycleRequestPage.dart';
import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/collectorExclusivePages/CompleteRecycleRequestPage.dart';
import 'package:e_recycle_mobile_app/display/pages/requiresAuthPages/collectorExclusivePages/MaterialListPage.dart';
import 'package:e_recycle_mobile_app/helpers/DirectoryHelper.dart';
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
  bool isCollector = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.setUserType();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 8, 221, 193),
        fixedColor: Colors.white,
        currentIndex: this._currentIndex,
        type: BottomNavigationBarType.fixed,
        items: addNavbarItem(),
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
      
      case 4: 
        this.acceptedRecycleRequests();
        return;
      
      case 5: 
        this.materialList();
        return;

    }
  }


  List<BottomNavigationBarItem> addNavbarItem(){
    List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[];

    items.addAll(
      [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Recycle request list"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Make recycle request"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]
    );

    if(this.isCollector) items.addAll([
      BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "Accepted recycle requests"),
      BottomNavigationBarItem(icon: Icon(Icons.add), label: "Material list"),
    ]);

    return items;
  }


  void setUserType(){
    DirectoryHelper.getUserData().then((userData) {
      if(userData["user"]["type"] == "collector") setState(() { this.isCollector = true; });
    });
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

  void acceptedRecycleRequests(){
    setState(() => this.currentPage = CompleteRecycleRequestPage());
  }

  void materialList(){
    setState(() => this.currentPage = MaterialListPage());
  }



}