import 'package:flutter/material.dart';

import 'participant_card.dart';

class DoubleParticipantCard extends StatefulWidget {
  DoubleParticipantCard({
    super.key,
    required this.isMicOn,
    required this.isVideoOn,
  });

  bool isMicOn;
  bool isVideoOn;

  @override
  State<DoubleParticipantCard> createState() => _DoubleParticipantCardState();
}

class _DoubleParticipantCardState extends State<DoubleParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ParticipantCard(
          imgUrl: 'assets/images/pfp_1.jpg',
          isMicOn: widget.isMicOn,
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
