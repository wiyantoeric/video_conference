class User {
  String uid;
  String username;
  String imgUrl;
  String? description;

  User({
    required this.uid,
    required this.username,
    this.imgUrl = 'assets/images/pfp_1.jpg',
    this.description,
  });
}
