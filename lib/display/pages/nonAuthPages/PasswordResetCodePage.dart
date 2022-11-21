import 'package:flutter/material.dart';


class PasswordResetCodePage extends StatefulWidget {
  const PasswordResetCodePage({super.key});


  @override
  State<PasswordResetCodePage> createState() => _PasswordResetCodePageState();
}

class _PasswordResetCodePageState extends State<PasswordResetCodePage> {

  final TextEditingController passwordResetCodeController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.passwordResetCodeController.dispose();
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
              hintText: "Enter password reset code",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: passwordResetCodeController, 
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
      if(this.passwordResetCodeController.text != "") this.loginButton = true;
    }
  }

  void passwordReset(){

  }
  

}