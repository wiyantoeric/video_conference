import 'package:flutter/material.dart';

import 'participant_card.dart';

class DoubleParticipantCard extends StatelessWidget {
  const DoubleParticipantCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ParticipantCard(
          imgUrl: 'assets/images/pfp_1.jpg',
          isMicOn: true,
          isVideoOn: false,
        ),
        SizedBox(width: 4),
        Icon(Icons.radio),
        SizedBox(width: 4),
        ParticipantCard(
          imgUrl: 'assets/images/pfp_2.jpg',
          isMicOn: false,
          isVideoOn: false,
        ),
      ],
    );
  }
}
