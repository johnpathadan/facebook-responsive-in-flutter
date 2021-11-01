import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class ContactsList extends StatelessWidget {
  // const ContactsList({ Key? key }) : super(key: key);
  final List <User> users;

  const ContactsList({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8.0,),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded( //to act as height for list view builder, or else, content won't show up
            child: ListView.builder(
              itemCount: users.length,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              itemBuilder: (BuildContext context, int index){
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}