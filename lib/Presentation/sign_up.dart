import 'package:flutter/material.dart';
import 'package:practise/Presentation/Widgets/textfield.dart';
import 'package:practise/Presentation/sign_in.dart';
import 'package:practise/Repository/Firebase/firebase_services.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'Widgets/button.dart';

class SignUp extends StatelessWidget {
  static const pageName = 'signUpPage';

  SignUp({Key? key}) : super(key: key);

  final _keyForm = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var servicesProvider =
        Provider.of<FirebaseServices>(context, listen: false);
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, SignInPage.pageName);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Constants.primaryColor,
          ),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                Constants.appName,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldCustomWidget(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
                hintText: 'Email',
                cursorColor: Constants.cursorColor,
                autoFocus: true,
                filled: true,
                fillColor: Constants.fillColor,
                userTextStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Constants.borderColor, width: 1),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Constants.focusBorderColor, width: 1),
                ),
                keyBoardType: TextInputType.number,
              ),
              TextFieldCustomWidget(
                hintText: 'Password',
                cursorColor: Constants.cursorColor,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
                obscureText: true,
                filled: true,
                fillColor: Constants.fillColor,
                userTextStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Constants.borderColor, width: 1),
                ),
                focusBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                      color: Constants.focusBorderColor, width: 1),
                ),
                keyBoardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                width: 200,
                height: 45,
                borderRadius: 20.0,
                backgroundColor: Constants.primaryColor,
                text: const Text(
                  'SIGNUP',
                ),
                textColor: Constants.textColor,
                elevation: 5.0,
                onTap: () {
                  if (_keyForm.currentState!.validate()) {
                    servicesProvider.signInUser(
                        email: _emailController.text,
                        password: _passwordController.text,
                        context: context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
