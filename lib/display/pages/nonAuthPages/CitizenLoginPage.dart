import 'package:flutter/material.dart';


class CitizenLoginPage extends StatefulWidget {
  const CitizenLoginPage({super.key});


  @override
  State<CitizenLoginPage> createState() => _CitizenLoginPageState();
}

class _CitizenLoginPageState extends State<CitizenLoginPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.usernameController.dispose();
    this.passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Image(image: AssetImage("lib/assets/app_logo.png"), height: 100, width: 100),

          TextField(
            decoration: InputDecoration(
              hintText: "Enter username",
              icon: Icon(Icons.person, color: Color.fromARGB(255, 8, 221, 193)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: usernameController,
            onChanged: (text){this.activateLogin();},
          ),


          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
              icon: Icon(Icons.lock, color: Color.fromARGB(255, 8, 221, 193))
            ),
            controller: passwordController, 
            onChanged: (text){this.activateLogin();},
          ),

          Text("   "),

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


              child: Text("Login"),
              onPressed: this.loginButton ? null : () => this.login()
            )
          ),

          Text("   "),


          SizedBox(
            width: double.infinity,
            height: 30,
            child:  ElevatedButton.icon(
              
              style: ButtonStyle(
                foregroundColor:  MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)), 
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 199, 0, 0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                )
              ),

              label: Text("Login with Google"),
              icon: ImageIcon(
                AssetImage("lib/assets/google.png"),
                color: Color.fromARGB(255, 255, 255, 255),
                
              ),
              onPressed: this.loginButton ? null : () => this.login()
            )
          ),


          Text("   "),

          SizedBox(
            width: double.infinity,
            height: 30,
            child:  ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 8, 57, 194)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                )
              ),

              icon: ImageIcon(
                AssetImage("lib/assets/facebook.png"),
                color: Color.fromARGB(255, 255, 255, 255),
              ),

              label: Text("Login with facebook"),
              onPressed: (){},
            )
          )


        ],
      )
    );
  }


  void activateLogin(){
    setState(){
      if(this.usernameController.text != "" && this.passwordController.text != "") this.loginButton = true;
      else this.loginButton = false;
    }
  }

  void login(){

  }
  

  void reset(){
    setState(() {
      this.usernameController.text = "";
      this.passwordController.text = "";
    });
  }




}