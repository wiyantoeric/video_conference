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
