import 'package:flutter/material.dart';
import 'package:practise/Presentation/sign_in.dart';
import 'package:practise/Repository/Firebase/firebase_services.dart';
import 'package:practise/RouteAndNavigation/route_configuration.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseServices>(
          create: (context) => FirebaseServices(),
        ),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        initialRoute: '/',
        onGenerateRoute: routeConfiguration,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  SignInPage(),
      ),
    );
  }
}
