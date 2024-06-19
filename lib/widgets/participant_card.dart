import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';

import 'profile_call_card.dart';

class ParticipantCard extends StatelessWidget {
  const ParticipantCard({
    super.key,
    required this.enableControl,
    required this.user,
    this.reverse = false,
  });

  final User user;
  final bool enableControl;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        !reverse ? Text(user.username) : Container(),
        ProfileCallCard(
          user: user,
          isCurrentUser: enableControl,
        ),
        reverse ? Text(user.username) : Container(),
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
