import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

import '../../../common_widget/custom_button.dart';
import '../../../common_widget/text_style.dart';
import '../../../core/app_router.gr.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final nameValidator = ValidationBuilder().required().build();
  final emailValidator = ValidationBuilder().email().build();
  final phoneValidator = ValidationBuilder().phone().build();
  final passwordValidator = ValidationBuilder().minLength(6).build();

  bool isObscured = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.green,
                ),
                labelText: 'Name',
              ),
              // validator: nameValidator,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please Enter Name';
                }
                return null;
              },
              onSaved: (String value) {
                // name = value;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.green,
                ),
                labelText: 'Email',
              ),
              validator: emailValidator,
              onSaved: (String value) {},
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: Colors.green,
                ),
                labelText: 'Phone',
              ),
              validator: phoneValidator,
              onSaved: (String value) {},
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.green),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.green,
                ),
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isObscured = !isObscured;
                    });
                  },
                  icon: Icon(
                    isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
              obscureText: isObscured,
              validator: passwordValidator,
            ),
            SizedBox(height: 20),
            CustomFullWidthButton(
              text: 'Signup',
              onPressed: () {
                if (_formkey.currentState.validate()) {
                  print("successful");

                  return;
                } else {
                  print("Invalid Email or Password");
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Constants.donthave,
                  ),
                  InkWell(
                    onTap: () =>
                        ExtendedNavigator.of(context).push(Routes.signinPage),
                    child: Text(
                      "Login",
                      style: Constants.signIn,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
