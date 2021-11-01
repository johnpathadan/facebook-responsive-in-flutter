import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/screens/home_screen.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NavScreen extends StatefulWidget {
  // const NavScreen({ Key? key }) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
//here we created a stateful widget because it can mainatain the state of the selected tab
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu,
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController( //This is to show the tabbar on the screen
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context) ? PreferredSize(
          child: CustomAppBar(
            currentUser: currentUser,
            icons: _icons,
            selectedIndex: _selectedIndex,
            onTap: (index)=> setState(() => _selectedIndex = index),
          ), 
        preferredSize: Size(screenSize.width, 100.0)) :null,

        // body:  TabBarView( //commented out because, TabBarView seems to be lagging in the web
        //   physics: NeverScrollableScrollPhysics(), //to avoid scrolling pages, you can now only navigate by Tab bar
        //   children: _screens,),
        body: IndexedStack(index: _selectedIndex, children: _screens,),
        //indexedstack also helps in maintaining our scroll position even if we navigated to another page and return
        //the page navigation will be where we initially left out
        bottomNavigationBar: !Responsive.isDesktop(context)? Container( //Responsive.isDesktop(context) to make the screen responsive
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(icons: _icons,
           selectedIndex: _selectedIndex,
           onTap: (index)=> setState(() => _selectedIndex = index), //this is to make the selected index as our new index
           
          ),
        ): const SizedBox.shrink(),
      ),
    );
  }
}