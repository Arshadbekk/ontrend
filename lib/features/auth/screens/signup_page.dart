import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ontrend/core/utils.dart';
import 'package:ontrend/features/auth/controller/auth_controller.dart';
import 'package:ontrend/features/auth/screens/login_page.dart';

import '../../../main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var initialCountryCode = "+91";
  void creatUser({
    required WidgetRef ref,
  }) {
    ref.read(authControllerProvider.notifier).creatuser(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        phone: phoneNumberController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Register",
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "Just a few things to get Started",
              style: TextStyle(fontSize: w * 0.05),
            ),
            SizedBox(
              height: w * 0.05,
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
                controller: firstNameController,
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
                  hintText: "First Name",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.05,
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
                controller: lastNameController,
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
                  hintText: "Last Name",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.05,
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
                controller: emailController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
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
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: w * 0.05,
            ),
            Container(
                width: w * 0.9,
                height: w * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w * 0.03),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: w * 0.01)
                    ]),
                child: IntlPhoneField(
                  initialValue: initialCountryCode,
                  initialCountryCode: "IN",
                  onCountryChanged: (value) {
                    initialCountryCode = value.dialCode;
                    print("===$initialCountryCode");
                  },
                  showCountryFlag: false,
                  disableLengthCheck: true,
                  dropdownIconPosition: IconPosition.trailing,
                  flagsButtonPadding: EdgeInsets.only(left: w * 0.03),
                  controller: phoneNumberController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
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
                    hintText: "Phone",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                )),
            SizedBox(
              height: w * 0.05,
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
                controller: passwordController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
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
                  hintText: "Create Password",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
           Consumer(builder: (context, ref, child) =>  GestureDetector(
             onTap: () {
               if(firstNameController.text.isEmpty){
                 showSnackBar(context, "Enter FirstName");
               }else if(lastNameController.text.isEmpty){
                 showSnackBar(context, "Enter LastName");
               }else if(emailController.text.isEmpty){
                 showSnackBar(context, "Enter Email");
               }else if(phoneNumberController.text.isEmpty){
                 showSnackBar(context, "Enter Number");
               }else if(passwordController.text.isEmpty){
                 showSnackBar(context, "Enter Password");
               }else{
                 creatUser(ref: ref);
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
                   "Create Account",
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
              },
              child: RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: w * 0.04),
                    children: [
                      TextSpan(
                          text: "Sign n",
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
