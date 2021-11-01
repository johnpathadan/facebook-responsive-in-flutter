import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/profile_avatar.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  // const PostContainer({ Key? key }) : super(key: key);
  final Post post;

  const PostContainer({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: isDesktop? 5.0: 0.0), //margin because drop shadow needs to be visible to left and right side
      elevation: isDesktop?1.0 : 0.0,
      shape: isDesktop? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ): null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.white,
        child: Column( //This column is to add images
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0), //we applied padding here because we dont want to put padding around images above
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, //to stretch across the entire width of the container
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 4.0,),
                  Text(post.caption),
                  post.imageUrl != null
                  ? const SizedBox.shrink()
                  : const SizedBox(height: 6.0,)
                ],
              ),
            ),
            post.imageUrl != null? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CachedNetworkImage(imageUrl: post.imageUrl),
            ): const SizedBox.shrink(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStats(post: post),
            )
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  // const _PostHeader({ Key? key }) : super(key: key);
  final Post post;

  const _PostHeader({Key key, @required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name, style: const TextStyle(fontWeight: FontWeight.w600,)),
              Row(children: [
                Text('${post.timeAgo} .',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12.0
                ),
                ),
                Icon(Icons.public,
                color: Colors.grey[600],
                size: 12.0,
                )

              ],)
            ],
          ),
        ),
        IconButton(onPressed: ()=> print('More'), icon: const Icon(Icons.more_horiz)) //more_horiz is the three dot button
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  // const _PostStats({ Key? key }) : super(key: key);
  final Post post;

  const _PostStats({Key key,@required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.thumb_up,
              size: 10.0,
              color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0,),
            Expanded( //we added expanded to push the following comments and shares all the way to the right side

              child: Text('${post.likes}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
              ),
            ),
            Text('${post.comments} comments',
            style: TextStyle(
              color: Colors.grey[600],
            ),
            ),
            const SizedBox(width: 8.0,),
            Text('${post.shares} shares',
            style: TextStyle(
              color: Colors.grey[600],
            ),
            )
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline,
              color: Colors.grey[600],
              size: 20.0,
              ),
              label: 'Like',
              onTap: ()=> print('Like')
            ),
            _PostButton(
              icon: Icon(MdiIcons.comment,
              color: Colors.grey[600],
              size: 20.0,
              ),
              label: 'Like',
              onTap: ()=> print('Comment')
            ),
            _PostButton(
              icon: Icon(MdiIcons.share,

              color: Colors.grey[600],
              size: 25.0,
              ),
              label: 'Like',
              onTap: ()=> print('Share')
            ),
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  // const _PostButton({ Key? key }) : super(key: key);
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({Key key,@required this.icon,@required this.label,@required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(  //this is to apply the ink effect
      color: Colors.white,
        child: InkWell( //To get nice ink effect on our buttons
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0,),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


