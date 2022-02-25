import 'package:flutter/material.dart';
import 'package:shared_pref/pages/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';
import '../services/pref_service.dart';
class HomePage extends StatefulWidget {
static final String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myName = '';

  void showName(String name){
    setState(() {
      myName = name;
    });
  }
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void doLogin(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    User user = User.from(email: email, password: password);
    Prefs.storeUser(user);
    Prefs.loadUser().then((user) => {print(user?.email),});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ic_image1.jpeg'),
                    fit: BoxFit.cover
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Log in to your existant account Q Allure", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
              //main
              SizedBox(height: 20,),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: InputBorder.none,
                          icon: Icon(Icons.person_outlined, color: Colors.grey,)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                            icon: Icon(Icons.lock_outline, color: Colors.grey,)
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("Forgot password", textAlign: TextAlign.end,)),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      width: double.infinity,
                      child: Expanded(
                        child: GestureDetector(
                          onTap: () {
                            doLogin();
                          },
                          child: Container(
                            height: 50,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: Offset(0, 2), // changes position of shadow
                                ),
                              ],
                              color: Colors.blue,
                            ),
                            child: Center(child: Text("Log in", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 60,),
                    Text("Or connect using", style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 10,),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Icon(Icons.facebook, color: Colors.white,),
                                   Text('Facebook', style: TextStyle(color: Colors.white),)
                                 ],
                               ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.g_mobiledata, color: Colors.white,),
                                  Text('Google', style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don`t have an account?'),
                        SizedBox(width: 3,),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, SignUp.id);
                            },
                            child: Text('Sign up', style: TextStyle(color: Colors.blue),)),
                      ],
                    )
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }
}
