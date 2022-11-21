import 'package:flutter/material.dart';


class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({super.key});


  @override
  State<PasswordResetPage> createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {

  final TextEditingController emailController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.emailController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your account's email",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: emailController, 
            onChanged: (text){this.activateResetPassword();},
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


              child: Text("Next"),
              onPressed: this.loginButton ? null : () => this.passwordReset()
            )
          ),


        ],
      )
    );
  }


  void activateResetPassword(){
    setState(){
      if(this.emailController.text != "") this.loginButton = true;
    }
  }

  void passwordReset(){

  }
  

}