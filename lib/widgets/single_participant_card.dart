import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/widgets/participant_card.dart';

class SingleParticipantCard extends StatelessWidget {
  SingleParticipantCard({
    super.key,
    required this.user,
    required this.isMicOn,
    required this.isVideoOn,
  });

  final User user;
  bool isMicOn;
  bool isVideoOn;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.radio),
        SizedBox(height: 12),
        ParticipantCard(
          enableControl: true,
          user: user,
        ),
      ],
    );
  }
}
