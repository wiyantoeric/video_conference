import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/providers/call_action_provider.dart';

class CallActionBar extends StatelessWidget {
  const CallActionBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<CallActionProvider>(
              builder: (context, value, child) {
            if (value.isMicOn) {
              return IconButton.filledTonal(
                onPressed: () => value.toggleMic(),
                icon: Icon(Icons.mic),
              );
            }
            return IconButton.filled(
              onPressed: () => value.toggleMic(),
              icon: Icon(Icons.mic_off),
            );
          }),
          Consumer<CallActionProvider>(
              builder: (context, value, child) {
            if (value.isVideoOn) {
              return IconButton.filledTonal(
                onPressed: () => value.toggleVideo(),
                icon: Icon(Icons.videocam),
              );
            }
            return IconButton.filled(
              onPressed: () => value.toggleVideo(),
              icon: Icon(Icons.videocam_off),
            );
          }),
          Consumer<CallActionProvider>(
              builder: (context, value, child) {
            if (value.isCaptionOn) {
              return IconButton.filledTonal(
                onPressed: () => value.toggleCaption(),
                icon: Icon(Icons.closed_caption),
              );
            }
            return IconButton.filled(
              onPressed: () => value.toggleCaption(),
              icon: Icon(Icons.closed_caption_disabled),
            );
          }),
          IconButton.filledTonal(
            onPressed: null,
            icon: Icon(Icons.edit_note),
          ),
        ],
      ),
    );
  }
}
