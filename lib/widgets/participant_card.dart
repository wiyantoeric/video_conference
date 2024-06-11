import 'package:flutter/material.dart';

class ParticipantCard extends StatefulWidget {
  ParticipantCard({
    super.key,
    required this.imgUrl,
    required this.isMicOn,
    required this.isVideoOn,
  });

  final String imgUrl;
  bool isMicOn;
  bool isVideoOn;

  @override
  State<ParticipantCard> createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Username'),
        SizedBox(height: 12),
        Container(
          width: 120,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Stack(
              children: [
                Image.asset(
                  widget.imgUrl,
                  fit: BoxFit.cover,
                ),
                if (!widget.isMicOn) MutedBackdrop(),
              ],
            ),
          ),
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
