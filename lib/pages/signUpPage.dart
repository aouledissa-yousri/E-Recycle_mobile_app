import 'package:e_recycle/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  String _name="";
  String _familyName="";
  String _password="";
  String _phoneNumber="";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildFamilyName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Family Name'),
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Family Name is Required';
        }

        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
      keyboardType: TextInputType.visiblePassword,
      validator: ( value) {
        if (value!.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (value) {
        _password = value!;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }
        return null;
      },
      onSaved: ( value) {
        _phoneNumber = value!;
      },
    );
  }

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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildFamilyName(),
                _buildPassword(),
                _buildPhoneNumber(),
                SizedBox(height: 50),
              Container(
                height: 65.0,
                
                child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                   onPressed: () {
                     setState(() {
                       Get.to(Home());
                     });
                      },
                  style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
                   child: Ink(
                    decoration: BoxDecoration(
                    gradient:
                    const LinearGradient(colors: [Color(0xff4ABB47), Color(0xff97D136)]),
                borderRadius: BorderRadius.circular(20)),
                     child: Container(
              width: 500,
              height: 200,
              alignment: Alignment.center,
              child: const Text(
                'Sign Up',
                style:
                    const TextStyle(fontSize: 24,),
              ),
            ),
          ),
        ),
      ),
              ),
                    SizedBox(height: 10),
                     SocialLoginButton(
                buttonType: SocialLoginButtonType.facebook,
                text: "Sign up with Facebook",
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              SocialLoginButton(
                buttonType: SocialLoginButtonType.google,
                text: "Sign up with Google",
                onPressed: () {},
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


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
    return true;
  }
}
