
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';


class CreatePostContainer extends StatelessWidget {
  // const CreatePostContainer({ Key? key }) : super(key: key);
  final User currentUser;

  const CreatePostContainer({Key key, @required this.currentUser}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop? 5.0: 0.0), //margin because drop shadow needs to be visible to left and right side
      elevation: isDesktop?1.0 : 0.0,
      shape: isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ): null,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0), //bottom 0.0 because flat buttons underneath will add the padding
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl,),
                const SizedBox( //we added const because when re rendering it does'nt have to rebuild
                  width: 8.0,
                ),
                Expanded( //Because textfield does'nt know how big it needs to become
                  child: TextField(
                    decoration: InputDecoration.collapsed( //.collapsed to remove the line under the text field
                      hintText: 'What\'s on your mind?'
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container( //container created for the flatButtons to take up less space
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(onPressed: ()=> print('Live'),
                   icon: const Icon(
                     Icons.videocam
                   ),
                    label: Text('Live'),),

                    const VerticalDivider(
                      width: 8.0,
                    ),

                    FlatButton.icon(onPressed: ()=> print('Photo'),
                   icon: const Icon(
                     Icons.photo_library,
                     color: Colors.green,
                   ),
                    label: Text('Live'),),

                    const VerticalDivider(
                      width: 8.0,
                    ),

                     FlatButton.icon(onPressed: ()=> print('Room'),
                   icon: const Icon(
                     Icons.video_call,
                     color: Colors.purpleAccent,
                   ),
                    label: Text('Live'),),
                    
                    

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}