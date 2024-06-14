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
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<CallActionProvider>(builder: (context, value, child) {
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
          Consumer<CallActionProvider>(builder: (context, value, child) {
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
          Consumer<CallActionProvider>(builder: (context, value, child) {
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
            onPressed: () {
              showModalBottomSheet<void>(
                isScrollControlled: true,
                barrierColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: .3,
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            right: 20,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.open_in_full),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 30),
                                    child: TextFormField(
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        hintText: 'Write a message',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                      spacing: 4,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.camera_alt),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.image),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.keyboard_tab),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.send),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.edit_note),
          ),
        ],
      ),
    );
  }
}
