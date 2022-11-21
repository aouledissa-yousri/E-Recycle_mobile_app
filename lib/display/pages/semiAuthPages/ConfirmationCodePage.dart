import 'package:flutter/material.dart';


class ConfirmationCodePage extends StatefulWidget {
  const ConfirmationCodePage({super.key});


  @override
  State<ConfirmationCodePage> createState() => _ConfirmationCodePageState();
}

class _ConfirmationCodePageState extends State<ConfirmationCodePage> {

  final TextEditingController confirmationCodeController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.confirmationCodeController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Text(
            "Your account is unverified, we have a sent a verification code to your email",
            textAlign: TextAlign.center,
          ),

          Text("  "),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter account verification code",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: confirmationCodeController, 
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
      if(this.confirmationCodeController.text != "") this.loginButton = true;
    }
  }

  void passwordReset(){

  }
  

}