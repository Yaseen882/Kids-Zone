import 'package:flutter/material.dart';
import 'package:practise/constants.dart';

class Dashboard extends StatelessWidget {
  static const pageName = 'dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Constants.primaryColor,
          child: const Center(
            child: Text('Kids Zone'),
          ),
        ),
      ),
    );
  }
}
