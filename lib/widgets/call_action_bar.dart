import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/model/caption.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/providers/call_provider.dart';
import 'package:video_conference/temp/user_data.dart';
import 'package:video_conference/widgets/user_caption_row.dart';

class CallActionBar extends StatefulWidget {
  const CallActionBar({
    super.key,
  });

  @override
  State<CallActionBar> createState() => _CallActionBarState();
}

class _CallActionBarState extends State<CallActionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Consumer<CallActionProvider>(builder: (context, value, child) {
            if (value.isMicOn) {
              return IconButton.filled(
                onPressed: () => value.toggleMic(),
                icon: Icon(Icons.mic),
              );
            }
            return IconButton.filledTonal(
              onPressed: () async {
                var status = await Permission.microphone.status;
                // Disable mic function if mic permission denied
                if (!status.isGranted) {
                  status = await Permission.microphone.request();
                  return;
                }
                value.toggleMic();
              },
              icon: Icon(Icons.mic_off),
            );
          }),
          Consumer<CallActionProvider>(builder: (context, value, child) {
            if (value.isVideoOn) {
              // Turn off video button
              return IconButton.filled(
                onPressed: () => value.toggleVideo(),
                icon: Icon(Icons.videocam),
              );
            }
            // Turn on video button
            return IconButton.filledTonal(
              onPressed: () async {
                var status = await Permission.camera.status;
                // Disable video function if camera permission denied
                if (!status.isGranted) {
                  status = await Permission.camera.request();
                  return;
                }
                value.toggleVideo();
              },
              icon: Icon(Icons.videocam_off),
            );
          }),
          Consumer<CallActionProvider>(builder: (context, value, child) {
            if (value.isCaptionOn) {
              // Turn off closed caption button
              return IconButton.filled(
                onPressed: () => value.toggleCaption(),
                icon: Icon(Icons.closed_caption),
              );
            }
            return IconButton.filledTonal(
              // Turn on closed caption button
              onPressed: () => value.toggleCaption(),
              icon: Icon(Icons.closed_caption_disabled),
            );
          }),
          Consumer<CallActionProvider>(builder: (context, value, child) {
            if (value.isShareScreen) {
              // Turn off closed caption button
              return IconButton.filled(
                onPressed: () => value.toggleShareScreen(),
                icon: Icon(Icons.cancel_presentation),
              );
            }
            // Turn on closed caption button
            return IconButton.filledTonal(
              onPressed: () => value.toggleShareScreen(),
              icon: Icon(Icons.present_to_all),
            );
          }),
          IconButton.filledTonal(
            onPressed: () {
              // Show modal bottom sheet on click
              buildModalBottomSheet(context);
            },
            icon: Icon(Icons.edit_note),
          ),
        ],
      ),
    );
  }

  Future<void> buildModalBottomSheet(BuildContext context) {
    final chatController = TextEditingController();
    bool isExpanded = false;

    return showModalBottomSheet<void>(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return FractionallySizedBox(
              heightFactor: isExpanded ? .8 : .3,
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    // Chat container, opened on maximise icon clicked
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 12, 12, 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Chat log
                          isExpanded
                              ? Expanded(
                                  child: ListView(
                                    children: [
                                      Consumer<CallProvider>(
                                        builder: (context, value, child) {
                                          return Column(
                                            children: [
                                              ...List<Widget>.from(
                                                value.chats.map(
                                                  (chat) {
                                                    return Column(
                                                      children: [
                                                        UserCaptionRow(
                                                          caption: Caption(
                                                            user: chat.user,
                                                            text: chat.text,
                                                          ),
                                                        ),
                                                        SizedBox(height: 12),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          // Chat input box
                          isExpanded ? Divider() : Container(),
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: TextFormField(
                              controller: chatController,
                              maxLines: 4,
                              decoration: InputDecoration(
                                hintText: 'Write a message',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          // Chat action bar
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  onPressed: () {
                                    if (!context.mounted) return;
                                    // TODO: Manage main user
                                    context.read<CallProvider>().sendChat(
                                          user1,
                                          chatController.text,
                                        );
                                    chatController.clear();
                                  },
                                  icon: Icon(Icons.send),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: IconButton(
                        onPressed: () => {
                          // Toggle open and close chat container
                          setState(() {
                            isExpanded = !isExpanded;
                          }),
                        },
                        icon: isExpanded
                            ? Icon(Icons.close_fullscreen)
                            : Icon(Icons.open_in_full),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
