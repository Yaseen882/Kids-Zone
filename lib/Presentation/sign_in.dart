import 'package:flutter/material.dart';
import 'package:practise/Presentation/Widgets/button.dart';
import 'package:practise/Presentation/Widgets/textfield.dart';
import 'package:practise/Presentation/sign_up.dart';
import 'package:practise/Repository/Firebase/firebase_services.dart';
import 'package:practise/constants.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  static const pageName = 'signInPage';
   SignInPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FirebaseServices firebaseProvider =  Provider.of<FirebaseServices>(context,listen: false);
    return Form(
      key: keyForm,
      child: Scaffold(
        backgroundColor: Constants.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            TextFieldCustomWidget(
              controller: emailController,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter email';
                }
                return null;
              },
              hintText: 'UserName',
              cursorColor: Constants.cursorColor,
              autoFocus: true,
              filled: true,
              fillColor: Constants.fillColor,
              userTextStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.person),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Constants.borderColor, width: 1),
              ),
              focusBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    const BorderSide(color: Constants.focusBorderColor, width: 1),
              ),
              keyBoardType: TextInputType.number,
            ),
            TextFieldCustomWidget(
              hintText: 'Password',
              controller: passwordController,
              validator: (value) {
                if(value == null || value.isEmpty){
                  return 'Please enter password';
                }
                return null;
              },
              cursorColor: Constants.cursorColor,
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
                borderSide:
                    const BorderSide(color: Constants.focusBorderColor, width: 1),
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
                'LOGIN',
              ),
              textColor: Constants.textColor,
              elevation: 5.0,
              onTap: () {
                if(keyForm.currentState!.validate()){
                  firebaseProvider.userSignIn(email: emailController.text,password: passwordController.text,context: context);
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have account ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Constants.textSize,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUp.pageName);
                  },
                  child:  Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: Constants.textSize,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
