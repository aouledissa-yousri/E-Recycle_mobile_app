import 'dart:convert';

import 'package:e_recycle_mobile_app/helpers/DateHelper.dart';
import 'package:e_recycle_mobile_app/helpers/DirectoryHelper.dart';
import 'package:e_recycle_mobile_app/helpers/MaterialHelper.dart';
import 'package:e_recycle_mobile_app/models/RecycleRequest.dart';
import 'package:e_recycle_mobile_app/services/RecycleRequestManagementService.dart';
import 'package:flutter/material.dart';


class MakeRecycleRequestPage extends StatefulWidget {
  const MakeRecycleRequestPage({super.key});

  @override
  State<MakeRecycleRequestPage> createState() => _MakeRecycleRequestPageState();
}

class _MakeRecycleRequestPageState extends State<MakeRecycleRequestPage> {

  String material = "Choose material";
  late List<dynamic> materials;
  int selectedMaterial = 0;
  bool submitButton = false;


  final TextEditingController unitController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getMaterials();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Make Recycle Request \n\n", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ListTile(
            leading: Text(material),
            trailing: IconButton(
              icon: Icon(Icons.arrow_drop_down, color: Color.fromARGB(255, 8, 221, 193)),
              onPressed: () => listMaterials()
            )
          ),

          Divider(color: Color.fromARGB(255, 39, 39, 39), endIndent: 16, indent: 16),

          TextField(
            decoration: InputDecoration(
                hintText: "Enter unit",
            ),
            controller: unitController,
            onChanged: (value) => activateSubmit(),
          ),

          TextField(
            decoration: InputDecoration(
                hintText: "Enter address",
            ),
            controller: addressController, 
            onChanged: (value) => activateSubmit(),
          ),

          TextField(
            decoration: InputDecoration(
                hintText: "Enter quantity",
            ),
            controller: quantityController, 
            keyboardType: TextInputType.number,
            onChanged: (value) => activateSubmit(),
          ),

          Text("\n\n\n"),

          SizedBox(
            width: double.infinity,
            height: 30,
            child:  ElevatedButton(
                
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
              )
            ),
    
    
            child: Text("submit"),
              onPressed: this.submitButton ? () => this.submit() : null
            )
          ),

          
        ],
      )
    );
  }




  void getMaterials(){
    RecycleRequestManagementService.getMaterials().then((response) => this.materials = MaterialHelper.fetchMaterials(response.body));
  }

  void listMaterials(){

    List<ListTile> optionsList = <ListTile>[];

    for(int i = 0; i < materials.length; i++)
      optionsList.add(
        ListTile(
          title: Text(this.materials[i].getType()),
          leading: Radio(  
            value: i,  
            groupValue: selectedMaterial,  
            onChanged: (value) => setState(() {
              setSelectedMaterial(value);
            })
          )
        )
      );

    showDialog(context: context, builder: (context){
          
      return SimpleDialog(
        title: Text("Material"),
        children: optionsList
      );

    });
  }



  setSelectedMaterial(int? value){
    setState(() {
      this.selectedMaterial = value!;
      this.material = this.materials[this.selectedMaterial].getType();
    });
    Navigator.of(context).pop();
    listMaterials();
  }


  void submit() async {
    RecycleRequestManagementService.makeRecycleRequest(RecycleRequest.createRecycleRequest(this.material, double.parse(this.quantityController.text), this.unitController.text, this.addressController.text, DateHelper.generateCurrentDate(), "Pending"), await DirectoryHelper.getToken()).then((response) {
      this.reset();
      dynamic responseData = jsonDecode(response.body);
      showDialog(context: context, builder: (context){
          
          return AlertDialog(
            title: Text("Success"),
            content: Text(responseData["message"]),
            actions: [
              ElevatedButton(
                onPressed: Navigator.of(context).pop, 
                child: Text("OK"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 221, 193))
                )
              )
            ],
          );
        });
    });
  }

  void activateSubmit(){
    if(this.unitController.text != "" && this.addressController.text != "" && this.quantityController != "") setState(() => this.submitButton = true);
    else setState(() => this.submitButton = false);
  }


  void reset(){
    setState(() {
      this.unitController.text = "";
      this.addressController.text = "";
      this.quantityController.text = "";
    });
  }


}