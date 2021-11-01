import 'package:meta/meta.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';


class Story {
  final User user;
  final String imageUrl;
  final bool isViewed; //allows us to know whether this story is viewed or not

  const Story({
    @required this.user,
    @required this.imageUrl,
    this.isViewed = false,
  });
}
