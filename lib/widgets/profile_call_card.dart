import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/widgets/camera_capture.dart';
import 'package:video_conference/widgets/participant_card.dart';

class ProfileCallCard extends StatelessWidget {
  const ProfileCallCard({
    super.key,
    required this.user,
    required this.isCurrentUser,
  });

  final User user;
  // Differ current user among participants to allow control
  // TODO: Uplift isCurrentUser to main user controller
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Consumer<CallActionProvider>(
          builder: (context, value, child) {
            /*
              TODO: Create a profile appearance controller
              - Determine iscurrentuser and others
              - Listen to cloud changes and control ProfileCard appearance
            */
            return Stack(
              children: [
                isCurrentUser && value.isVideoOn
                    ? ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: const CameraCapture())
                    : Image.asset(
                        user.imgUrl,
                        fit: BoxFit.cover,
                        height: double.infinity,
                      ),
                // Control mute backdrop for current user
                isCurrentUser && !value.isMicOn
                    ? const MutedBackdrop()
                    : const SizedBox(),
                // Show video if [isVideoOn]
                isCurrentUser && value.isVideoOn
                    ? Positioned(
                        top: 20,
                        right: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(1000),
                          child: Container(
                            color: Colors.red,
                            width: 8,
                            height: 8,
                          ),
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}
