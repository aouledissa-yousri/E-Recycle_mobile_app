import 'dart:math';

import 'package:flutter/material.dart';

class ListMaterial extends StatefulWidget {
  @override
  _ListMaterialState createState() => _ListMaterialState();
}

class _ListMaterialState extends State<ListMaterial> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper:  Customshape(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [Color(0xff4ABB47), Color(0xff97D136)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                ))
            
          ),
        ),
      ),
      body: SafeArea(
          child: GridView.builder(
              itemCount: gridlist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          
                          child:
                          SizedBox(
                            height: 150.0,
                            width: 100.0,
                             child: gridlist[index].image)
                        ),
                       SizedBox(
                        
                        height: 30,
                    
                       child: Text(gridlist[index].title.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20  ),))
                      ],
                    ),
                  ),
                );
              })),
    );}}
class GridData {
  
  String? title;
 Widget? image;

  GridData(this.title, this.image);
}

final List<GridData> gridlist = [
  GridData("Plastic", Image(image: AssetImage('assets/images/bottle.png')),),
  GridData("Organics", Image(image: AssetImage('assets/images/apple.png')),),
  GridData("Glass", Image(image: AssetImage('assets/images/glass.png')),),
  GridData("Metal", Image(image: AssetImage('assets/images/metal.png')),),
  GridData("Paper", Image(image: AssetImage('assets/images/glass.png')),),
  GridData("Other", Image(image: AssetImage('assets/images/other.png')),),

];
class Customshape extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height-50);
    path.quadraticBezierTo(width/2, height, width, height-50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }}