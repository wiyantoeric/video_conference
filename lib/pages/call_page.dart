import 'package:flutter/material.dart';
import 'package:video_conference/widgets/double_participant_card.dart';

import '../widgets/call_header.dart';
import '../widgets/single_participant_card.dart';

class SingleCallPage extends StatefulWidget {
  const SingleCallPage({super.key});

  @override
  State<SingleCallPage> createState() => _SingleCallPageState();
}

class _SingleCallPageState extends State<SingleCallPage> {
  bool isMicOn = false;
  bool isVideoOn = false;
  bool isCcOn = true;
  bool isWriting = false;

  void handleMicPress() {
    setState(() {
      isMicOn = !isMicOn;
    });
  }

  void handleVideoPress() {
    setState(() {
      isVideoOn = !isVideoOn;
    });
  }

  void handleCcPress() {
    setState(() {
      isCcOn = !isCcOn;
    });
  }

  void handleWritePress() {}

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
              CallHeader(),
              // Body
              Expanded(
                child: Center(
                  child: DoubleParticipantCard(
                    isMicOn: isMicOn,
                    isVideoOn: isVideoOn,
                  ),
                ),
              ),
              // Action buttons
              Container(
                height: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isMicOn
                        ? IconButton.filledTonal(
                            onPressed: handleMicPress,
                            icon: Icon(Icons.mic),
                          )
                        : IconButton.filled(
                            onPressed: handleMicPress,
                            icon: Icon(Icons.mic_off),
                          ),
                    isVideoOn
                        ? IconButton.filledTonal(
                            onPressed: handleVideoPress,
                            icon: Icon(Icons.videocam),
                          )
                        : IconButton.filled(
                            onPressed: handleVideoPress,
                            icon: Icon(Icons.videocam_off),
                          ),
                    isCcOn
                        ? IconButton.filledTonal(
                            onPressed: handleCcPress,
                            icon: Icon(Icons.closed_caption),
                          )
                        : IconButton.filled(
                            onPressed: handleCcPress,
                            icon: Icon(Icons.closed_caption_disabled),
                          ),
                    IconButton.filledTonal(
                      onPressed: handleWritePress,
                      icon: Icon(Icons.edit_note),
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
