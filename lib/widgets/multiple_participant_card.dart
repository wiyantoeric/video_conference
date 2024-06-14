import 'package:flutter/material.dart';
import 'package:video_conference/model/caption.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/temp/user_data.dart';

import 'participant_card.dart';

class MultipleParticipantCard extends StatefulWidget {
  MultipleParticipantCard({
    super.key,
    required this.users,
  });

  List<User> users = [];

  @override
  State<MultipleParticipantCard> createState() =>
      _MultipleParticipantCardState();
}

class _MultipleParticipantCardState extends State<MultipleParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List<Widget>.from(
            widget.users.take(5).map((User user) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: ParticipantCard(
                  enableControl: false,
                  user: user,
                  reverse: true,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}