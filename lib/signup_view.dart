import 'dart:convert';

import 'package:shopping/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  var passwordhide = true;
  var cpasswordhide = true;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  Future<void> SubmitButton() async {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final confirmpassword = confirmpasswordController.text;

      if (password != confirmpassword) {
        const snackdemo = SnackBar(
          content: Text('password and confirm password does not match'),
          backgroundColor: Colors.red,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }

      else{
        final response = await http.post(
          Uri.parse('https://add24.in/api/insert.php'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'name': name, 'email': email, 'password': password}),
        );

        final responseData = jsonDecode(response.body);

        // Clear the form fields if the submission is successful
        if (responseData['message'] != 'User added successfully')
        {
          const snackdemo = SnackBar(
            content: Text('Already Exists'),
            backgroundColor: Colors.red,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
         }

        else {
          const snackdemo = SnackBar(
            content: Text('User added successfully'),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
          Get.off(LoginScreenView());
        }
      }

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // preferences.setString('name', name);
      // preferences.setString('email', email);
      // preferences.setString('password', password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                    'Signup is simply dummy text of the printing and typesetting industry.'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Username';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Email',
                            prefixIcon: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.email),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
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
                                  onTap: () {
                                    setState(() {
                                      passwordhide = !passwordhide;
                                    });
                                  },
                                  child: Icon(passwordhide == true
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        TextFormField(
                          controller: confirmpasswordController,
                          obscureText: cpasswordhide,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Confirm Password',
                            prefixIcon: Container(
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      cpasswordhide = !cpasswordhide;
                                    });
                                  },
                                  child: Icon(cpasswordhide == true
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        InkWell(
                          onTap: SubmitButton,
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
                                    child: Text(
                                      'SignUp',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                    InkWell(
                      onTap: () {
                        Get.to(LoginScreenView());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Color(0xffFF375F)),
                      ),
                    )
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
