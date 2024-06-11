import 'package:flutter/material.dart';
import 'package:video_conference/widgets/participant_card.dart';

class SingleParticipantCard extends StatelessWidget {
  SingleParticipantCard({
    super.key,
    required this.isMicOn,
    required this.isVideoOn,
  });

  bool isMicOn;
  bool isVideoOn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.radio),
        SizedBox(height: 12),
        ParticipantCard(
          imgUrl: 'assets/images/pfp_1.jpg',
          isMicOn: isMicOn,
          isVideoOn: isVideoOn,
        ),
      ],
    );
  }
}
