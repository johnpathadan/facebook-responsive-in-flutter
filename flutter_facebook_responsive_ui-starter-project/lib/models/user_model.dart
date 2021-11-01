import 'package:meta/meta.dart';

class User {
  final String name;
  final String imageUrl; //profile image

  const User({
    @required this.name,
    @required this.imageUrl,
  });
}
