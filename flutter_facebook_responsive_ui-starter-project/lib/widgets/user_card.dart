
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';

class UserCard extends StatelessWidget {
  // const UserCard({ Key? key }) : super(key: key);
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        mainAxisSize:  MainAxisSize.min, //so our row is shrunk into the small size
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0,),
          Flexible(
            
            child: Text(user.name,
            style: TextStyle(fontSize: 16.0),
            overflow: TextOverflow.ellipsis, //we had to add flexible to get the overflow property
            ),
          )

        ],
      ),
    );
  }
}