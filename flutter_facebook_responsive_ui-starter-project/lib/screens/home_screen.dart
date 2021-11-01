import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController = TrackingScrollController();

  @override
  void dispose() {  //just type in dis, click on dispose function, only works in stateful widget
    _trackingScrollController.dispose(); //dispose the tracking scroll controller when the HomeScreen is disposed from our view
    /*This allows us to keep custom scroll views in sync in the same position in the page, even if we are changing the UI pages*/
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(), /*what this does is if you are in mobile, if you click on the textfield,
      you can click anywhere on the screen to get rid of it*/
      child: Scaffold(
        body: Responsive( //to make the screen responsive
        mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
        desktop: _HomeScreenDesktop(scrollController: _trackingScrollController),
          
        )
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  // const _HomeScreenMobile({ Key? key }) : super(key: key);
  final TrackingScrollController scrollController;

  const _HomeScreenMobile({Key key, @required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView( //for slivers
            controller: scrollController,
            slivers: [
              SliverAppBar(
                brightness: Brightness.light, //turns the status bar items(time, wifi etc..) from white to black
                backgroundColor: Colors.white,
                title: Text('facebook',
                style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing:  -1.2,

                ),
                
                ),
                centerTitle: false,
                floating: true, //to make the appbar reappear as soon as we scroll up
                actions: [
                  CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: ()=> print('search')),
                  CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: ()=> print('Messenger')),

                ],
              ),
              SliverToBoxAdapter( //Everything inside a sliver app bar needs to be a sliver, if not, it needs to be converted to a sliver

                child: CreatePostContainer(currentUser: currentUser),
              ),
              //Some examples of other slivers are SliverPadding, SliverList, SliverGrid
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(  //sliver property instead of a child
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(  //sliver property instead of a child
                  child: Stories(currentUser:currentUser, stories: stories),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate( //equivalent to ListView.builder
                  (context, index){
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length
                ),
              ),
            ],
          );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  // const _HomeScreenDesktop({ Key? key }) : super(key: key);
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({Key key, @required this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              
              padding: const EdgeInsets.all(12.0),
              child: MoreOprionsList(currentUser: currentUser),
            ),
          ),
        ),

        const Spacer(),
         //this will put space between containers

        Container(
          width: 600.0, //we have set the max width to 600.0 inside our custom app bar
          child: CustomScrollView( //for slivers
            controller: scrollController,
            slivers: [
              
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(  //sliver property instead of a child
                  child: Stories(currentUser:currentUser, stories: stories),
                ),
              ),
              SliverToBoxAdapter( //Everything inside a sliver app bar needs to be a sliver, if not, it needs to be converted to a sliver

                child: CreatePostContainer(currentUser: currentUser),
              ),
              //Some examples of other slivers are SliverPadding, SliverList, SliverGrid
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(  //sliver property instead of a child
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate( //equivalent to ListView.builder
                  (context, index){
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          )
        )
      ],
    );
  }
}