// create a group model that has name, desc, and users
import 'package:video_conference/model/user.dart';

class Group {
  String name;
  String? description;
  List<User>? members;

  Group({
    required this.name,
    this.description,
    this.members,
  });
}
