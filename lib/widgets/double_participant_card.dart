import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

import 'participant_card.dart';

class DoubleParticipantCard extends StatefulWidget {
  const DoubleParticipantCard({
    super.key,
    required this.user1,
    required this.user2,
  });

  // TODO: Uplift isCurrentUser to user controller
  final User user1;
  final User user2;

  @override
  State<DoubleParticipantCard> createState() => _DoubleParticipantCardState();
}

class _DoubleParticipantCardState extends State<DoubleParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ParticipantCard(
              enableControl: true,
              user: widget.user1,
            ),
            const SizedBox(width: 4),
            const Icon(Icons.radio),
            const SizedBox(width: 4),
            ParticipantCard(
              enableControl: false,
              user: widget.user2,
            ),
          ],
        ),
      ],
    );
  }
}
