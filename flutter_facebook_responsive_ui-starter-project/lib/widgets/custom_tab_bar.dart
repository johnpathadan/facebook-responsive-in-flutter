import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  // const CustomTabBar({ Key? key }) : super(key: key);
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap; //(int because the function returns n int)
  final bool isBottomIndicator;

  const CustomTabBar({Key key,
  @required this.icons,
  @required this.selectedIndex,
  @required this.onTap,
  this.isBottomIndicator = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration( //indicator shows whaat will happen when a user taps on a tab, here we provide padding of blue color

        border: isBottomIndicator? Border(
          bottom: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0
          )
        ): Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0
          )
        )
      ),
      //changes below - 1:08:00 to create the color of the selected icon, so first we converted all the icons to a map with .asMap()
      //with .asMap, we have created, we have access to the index of the icons (i, e) => i is the index, e is the icon
      //when we do .amp over a map, we need to do map entry, and we added i as the key
      //to het the icons back, we added .values, which is just the Tab widget which we will then convert to a list
      tabs: icons.asMap() 
                .map((i, e) => MapEntry(i, Tab(icon: Icon(e,
                color:  i == selectedIndex? Palette.facebookBlue: Colors.black45,
                size: 30.0,
                ),))).values.toList(), //.map converts it into an iterable, .toList() converts it back into a list of tabs
      onTap: onTap,
    );
  }
}