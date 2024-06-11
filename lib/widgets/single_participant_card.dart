import 'package:flutter/material.dart';
import 'package:video_conference/widgets/participant_card.dart';

class SingleParticipantCard extends StatelessWidget {
  const SingleParticipantCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.radio),
        SizedBox(height: 12),
        ParticipantCard(
          imgUrl: 'assets/images/pfp_1.jpg',
          isMicOn: true,
          isVideoOn: false,
        ),
      ],
    );
  }
}
