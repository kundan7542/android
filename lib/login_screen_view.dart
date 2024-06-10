import 'dart:convert';

import 'package:shopping/home_screen.dart';
import 'package:shopping/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  var passwordhide = true;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> LoginButton() async{
    if (formKey.currentState!.validate()) {

      final email = nameController.text;
      final password = passwordController.text;

      final response = await http.post(
        Uri.parse('https://add24.in/api/login.php'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      final responseData = jsonDecode(response.body);

      if(responseData['message'] == 'Login successful.'){
        Get.to(HomeScreen());
      }
      else{
        const snackdemo = SnackBar(
          content: Text('Username or Password Wrong'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  Text('Welcome Back', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('Login with your account to continue.'),
            
                  SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                  Form(
                      key: formKey,
                      child: Column(children: [
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                        prefixIcon: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.person),
                        ),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Username';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),

                    TextFormField(
                      controller: passwordController,
                      obscureText: passwordhide,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        prefixIcon: Container(
                          child: InkWell(
                              onTap: (){
                                setState(() {
                                  passwordhide = !passwordhide;
                                });
                              },
                              child: Icon(passwordhide==true?Icons.visibility:Icons.visibility_off)),
                        ),
                      ),
                      validator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: (){
                              Get.to(SignupView());
                            },
                            child: Text('Forgot Password?')),
                      ],
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height*0.03),

                    InkWell(
                      onTap: (){
                        Get.to(LoginButton());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xffff64D2FF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('Login', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],)),

                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('or'),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff007aff),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(Icons.facebook, color: Colors.white,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                          Text('Continue with Facebook',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
            
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
            
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff007aff),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Icon(Icons.g_mobiledata_rounded, color: Colors.white,),
                          SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                          Text('Continue with Google',style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
            
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
            
                      SizedBox(width: MediaQuery.of(context).size.width*0.01),
            
                      InkWell(
                          onTap: (){
                            Get.to(SignupView());
                          },
                          child: Text('Create now', style: TextStyle(color: Color(0xffFF375F)),))
                    ],
                  )
            
                ],
              ),
            ),
          ),
        ),
    );
  }
}
