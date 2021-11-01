
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MoreOprionsList extends StatelessWidget {
  // const MoreOprionsList({ Key? key }) : super(key: key);
  final List<List> _moreOptionsList = const[
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'], //here index[0] is the icon, 1 is the color, 2is the text
    [Icons.ondemand_video, Palette.facebookBlue, 'Watch'],
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'],
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'],
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'],
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'],
    [MdiIcons.shieldAccount, Colors.deepPurple, 'Covid'],
  ];
  final User currentUser;

  const MoreOprionsList({Key key,@required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 280.0
      ),           
      child: ListView.builder(
        itemCount: 1+ _moreOptionsList.length, //we added 1 so we can add usercard for our current user
        itemBuilder: (BuildContext context, int index){
          if(index == 0){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: UserCard(user: currentUser)
              );
          }

          final List option = _moreOptionsList[index - 1]; //because 0 index right now is the UserCard

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _Option(icon: option[0], color: option[1], label: option[2]),
            );
        }
        ),
    );
  }
}


class _Option extends StatelessWidget {
  // const _Option({ Key? key }) : super(key: key);
  final IconData icon;
  final Color color;
  final String label;

  const _Option({Key key, @required this.icon, @required this.color, @required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> print(label),
      child: Row(
        children: [
          Icon(icon, size: 38.0, color: color,),
          const SizedBox(width: 6.0,),
          Flexible( //flexible wrapped over Text, so even if the text overflows, you don't get an error
            child: Text(label,
          style: const TextStyle(
            fontSize: 16.0
          ),
          overflow: TextOverflow.ellipsis,
          ),)

        ],
      ),

    );
  }
}