import 'package:flutter/material.dart';


class CitizenSignUpPage extends StatefulWidget {
  const CitizenSignUpPage({super.key});


  @override
  State<CitizenSignUpPage> createState() => _CitizenSignUpPageState();
}

class _CitizenSignUpPageState extends State<CitizenSignUpPage> {


  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.nameController.dispose();
    this.lastnameController.dispose();
    this.usernameController.dispose();
    this.emailController.dispose();
    this.passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [


          
          TextField(
            decoration: InputDecoration(
              hintText: "Enter name",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: nameController,
            onChanged: (text){this.activateSignUp();},
          ),



          TextField(
            decoration: InputDecoration(
              hintText: "Enter lastname",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: lastnameController,
            onChanged: (text){this.activateSignUp();},
          ),


          TextField(
            decoration: InputDecoration(
              hintText: "Enter email",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: emailController,
            onChanged: (text){this.activateSignUp();},
          ),


          TextField(
            decoration: InputDecoration(
              hintText: "Enter username",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: usernameController,
            onChanged: (text){this.activateSignUp();},
          ),


          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter password",
            ),
            controller: passwordController, 
            onChanged: (text){this.activateSignUp();},
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


              child: Text("Sign Up"),
              onPressed: this.loginButton ? null : () => this.signUp()
            )
          ),

          Text("   "),


          SizedBox(
            width: double.infinity,
            height: 30,
            child:  ElevatedButton(
              
              style: ButtonStyle(
                foregroundColor:  MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)), 
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 199, 0, 0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20))
                )
              ),

              child: Text("Reset"),
              onPressed: this.reset
            )
          ),


          Text("   "),

          


        ],
      )
    );
  }


  void activateSignUp(){
    setState(){
      if(this.usernameController.text != "" && this.passwordController.text != "") this.loginButton = true;
      else this.loginButton = false;
    }
  }

  void signUp(){

  }
  

  void reset(){
    setState(() {
      this.nameController.text = "";
      this.lastnameController.text = "";
      this.emailController.text = "";
      this.usernameController.text = "";
      this.passwordController.text = "";
    });
  }




}