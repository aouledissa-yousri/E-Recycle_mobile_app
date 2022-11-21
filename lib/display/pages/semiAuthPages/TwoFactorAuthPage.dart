import 'package:flutter/material.dart';


class TwoFactorAuthPage extends StatefulWidget {
  const TwoFactorAuthPage({super.key});


  @override
  State<TwoFactorAuthPage> createState() => _TwoFactorAuthPageState();
}

class _TwoFactorAuthPageState extends State<TwoFactorAuthPage> {

  final TextEditingController twoFactorAuthController = TextEditingController();

  bool loginButton = false;



  @override
  void dispose(){
    super.dispose();
    this.twoFactorAuthController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 200),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [

          Text(
            "We have sent a code so we can verify that the true account's owner has logged in",
            textAlign: TextAlign.center,
          ),

          Text("  "),

          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter 2-factor authentication code",
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 8, 221, 193)))
            ),
            controller: twoFactorAuthController, 
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
      if(this.twoFactorAuthController.text != "") this.loginButton = true;
    }
  }

  void passwordReset(){

  }
  

}