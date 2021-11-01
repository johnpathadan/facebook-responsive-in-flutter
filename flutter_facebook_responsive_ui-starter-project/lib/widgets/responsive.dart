import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  // const Responsive({ Key? key }) : super(key: key);
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({Key key, 
  @required this.mobile, 
  this.tablet, 
  @required this.desktop}) : super(key: key);

  static bool isMobile(BuildContext context) =>MediaQuery.of(context).size.width < 800;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width >= 1200;
  static bool isDesktop(BuildContext context) =>MediaQuery.of(context).size.width >=1200;
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(  //LayoutBuilder we are going to display mobile, tablet, desktop UI based on the size of the screen
      builder: (context, constraints){
        if(constraints.maxWidth >=1200.0){
          return desktop;
        }else if(constraints.maxWidth>=800){
          return tablet ?? mobile; //to specify if we dont have tablet specific code, display mobile
        }else{
          return mobile;
        }
      },
    );
  }
}