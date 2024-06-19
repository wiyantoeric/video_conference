import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/widgets/participant_card.dart';

// Widget showing single user in call room
class SingleParticipantCard extends StatelessWidget {
  const SingleParticipantCard({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.radio),
        const SizedBox(height: 12),
        ParticipantCard(
          enableControl: true,
          user: user,
        ),
      ],
    );
  }
}
