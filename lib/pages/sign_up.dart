import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/account_model.dart';
import '../services/pref_service.dart';
class SignUp extends StatefulWidget {
  static final String id = 'sign_up';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String myName = '';

  void showName(String name){
    setState(() {
      myName = name;
    });
  }
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void doLogin(){
    String name = nameController.text.toString().trim();
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String phone = phoneController.text.toString().trim();
    Account account = Account.from(email: email, phone: phone);
    Prefs.storeAccount(account);
    Prefs.loadAccount().then((account) => {print(account?.email),});
    Prefs.loadAccount().then((account) => {print(account?.phone),});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: Colors.black,),),
        backgroundColor: Colors.grey[50],
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Let`s Get Started", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 28),),
            SizedBox(height: 5,),
            Text("Create an account to Q Allure to get all features", style: TextStyle( color: Colors.grey,fontSize: 14),),
            SizedBox(height: 25,),
            Container(
              padding: EdgeInsets.only(left: 30),
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Name",
                    icon: Icon(Icons.person_outline),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    icon: Icon(Icons.email_outlined),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Phone",
                    icon: Icon(Icons.phone_iphone_outlined),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  controller: passwordController,
              decoration: InputDecoration(
              border: InputBorder.none,
                hintText: "Password",
                icon: Icon(Icons.lock_outline),
              ),
            ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30),
              margin: EdgeInsets.only(bottom: 20),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm password",
                    icon: Icon(Icons.lock_outlined),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                doLogin();
              },
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text("CREATE", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
              ),
            ),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?'),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Text('Login here', style: TextStyle(color: Colors.blueAccent),)),
              ],
            )
          ],
        ),
      )
    );
  }
}
