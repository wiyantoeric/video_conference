import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

import 'profile_call_card.dart';

class ParticipantCard extends StatelessWidget {
  ParticipantCard({
    super.key,
    required this.enableControl,
    required this.user,
  });

  final User user;
  bool enableControl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.username),
        SizedBox(height: 12),
        ProfileCallCard(
          user: user,
          isCurrentUser: enableControl,
        ),
      ],
    );
  }
}

class MutedBackdrop extends StatelessWidget {
  const MutedBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: .6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Center(
          child: Icon(Icons.mic_off),
        ),
      ],
    );
  }
}
