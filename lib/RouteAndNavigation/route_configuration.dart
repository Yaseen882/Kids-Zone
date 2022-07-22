import 'package:flutter/material.dart';
import 'package:practise/Presentation/dash_board.dart';
import 'package:practise/Presentation/sign_in.dart';
import 'package:practise/Presentation/sign_up.dart';
Route routeConfiguration(RouteSettings routeSettings){
  //print('...............................Settings Name.....................${routeSettings.name}');
     if(routeSettings.name == SignUp.pageName){
       return SlideTransitionPage(targetWidget:   SignUp(),position: SlidePosition.rightToLeft);
     }else if(routeSettings.name == SignInPage.pageName) {
       return SlideTransitionPage(targetWidget:  SignInPage(),position: SlidePosition.topToBottom);
     }else {
       return SlideTransitionPage(targetWidget:  const Dashboard(),position: SlidePosition.bottomToTop);
     }
}
enum SlidePosition {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

class SlideTransitionPage extends PageRouteBuilder {
  Widget targetWidget;

  SlideTransitionPage({required this.targetWidget, SlidePosition? position})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) {
            return targetWidget;
          },
    transitionDuration: const Duration(milliseconds: 700),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var rightToLeftTween =
      Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
      var leftToRightTween =
      Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
      var topToBottomTween =
      Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0));
      var bottomToTopTween =
      Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
      switch (position) {
        case SlidePosition.rightToLeft:
          return SlideTransition(
            position: rightToLeftTween.animate(animation),
            child: child,
          );
        case SlidePosition.leftToRight:
          return SlideTransition(
            position: leftToRightTween.animate(animation),
            child: child,
          );
        case SlidePosition.topToBottom:
          return SlideTransition(
            position: topToBottomTween.animate(animation),
            child: child,
          );
        case SlidePosition.bottomToTop:
          return SlideTransition(
            position: bottomToTopTween.animate(animation),
            child: child,
          );
        default:
          {
            throw 'Unknown Address';
          }
      }
    },
        );
}
