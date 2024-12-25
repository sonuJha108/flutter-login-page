import 'package:flutter/material.dart';
import 'package:recip_book_app/services/auth_service.dart';

class loginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<loginPage> {

  GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login"),),
      body: SafeArea(child: _buildUI()
      ),
    );
  }

  // _buildUI widget in the sections
  Widget _buildUI(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm()
        ],
      ),
    );
  }

  // _title widget in the sections
  Widget _title() {
    return Text("Recip Book", style: TextStyle(
    fontSize: 35,
      fontWeight: FontWeight.w300,
    ),
    );
  }

  // _loginForm sections

Widget _loginForm(){
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      TextFormField(
        // initial values

        initialValue: "emilys",

        // to save the username if the user enter the right username and password
        onSaved: (value){
          setState(() {
            username = value;
          });
        },

        // to validate the current user to login or enter the wrong username
        validator: (value){
          if(value == null || value.isEmpty){
            return "Enter the user name";
          }
        },
        decoration: InputDecoration(hintText: "Username "),
      ),
          TextFormField(
            // initial values

            initialValue: "emilyspass",
            // to not show the password then write the code

            obscureText: true,

            // to save the login user details in the password filed
            onSaved: (value){
              setState(() {
                password = value;
              });
            },
            validator: (value){
              if(value == null || value.length<5){
                return "Enter a valid password";
              }
            },
            decoration: InputDecoration(hintText: "password "),
          ),
          _loginButton(),
        ],
      ),
      )
    );
}

// _loginButton

Widget _loginButton(){
    return SizedBox(
    width: MediaQuery.sizeOf(context).height * 0.15,
      child: ElevatedButton(
        // button that click the current user are enter the right details
        onPressed: () async {
          if(_loginFormKey.currentState?.validate() ?? false){
            _loginFormKey.currentState?.save();
            bool result = await AuthService().login(username!, password!);
          }
        },
        child: const Text("Login",
        ),
      ),
    );
}

}
