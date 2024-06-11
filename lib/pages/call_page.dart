import 'package:flutter/material.dart';
import 'package:video_conference/widgets/double_participant_card.dart';

import '../widgets/single_participant_card.dart';

class SingleCallPage extends StatelessWidget {
  const SingleCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Image.asset(
                        'assets/images/pfp_1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Caller',
                        ),
                        Text(
                          'Description',
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout),
                  ),
                ],
              ),
              // Body
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: DoubleParticipantCard(),
                    )
                  ],
                ),
              ),
              // Action buttons
              Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: Icon(Icons.mic_off),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: Icon(Icons.videocam),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: Icon(Icons.closed_caption_rounded),
                    ),
                    IconButton.filledTonal(
                      onPressed: () {},
                      icon: Icon(Icons.edit_note_rounded),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
