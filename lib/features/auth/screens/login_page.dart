import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ontrend/features/auth/controller/auth_controller.dart';
import 'package:ontrend/features/auth/screens/signup_page.dart';

import '../../../core/utils.dart';
import '../../../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login({required WidgetRef ref}) {
    ref.read(authControllerProvider.notifier).loginUser(
        username: emailOrPhone.text.trim(),
        password: password.text.trim(),
        ref: ref,
        context: context);
  }

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/banners/welcome.png"),
            Text(
              "Welcome Back!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: w * 0.06),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              width: w * 0.9,
              height: w * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.03),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: w * 0.01)
                  ]),
              child: TextFormField(
                controller: emailOrPhone,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.03)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(w * 0.03)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(w * 0.03),
                  ),
                  hintText: "Email or Phone",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              width: w * 0.9,
              height: w * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.03),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: w * 0.01)
                  ]),
              child: TextFormField(
                controller: password,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(w * 0.03)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(w * 0.03)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(w * 0.03),
                  ),
                  hintText: "Password",
                  suffixIcon: Icon(Icons.visibility),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Consumer(builder: (context, ref, child) =>       GestureDetector(
        onTap: () {
          if(emailOrPhone.text.isEmpty){
            showSnackBar(context, "Enter Email or Number");
          }else if(password.text.isEmpty){
            showSnackBar(context, "Enter Password");
          }else{
            login(ref: ref);
          }
        },
        child: Container(
          height: w * 0.15,
          width: w * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(w * 0.03),
              color: Colors.orange),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: w * 0.05,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
            ),),
            SizedBox(
              height: h * 0.1,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
              },
              child: RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: w * 0.04),
                    children: [
                      TextSpan(
                          text: "Sign in",
                          style: TextStyle(color: Colors.blue.shade800))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
