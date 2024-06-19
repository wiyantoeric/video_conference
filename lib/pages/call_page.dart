import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/providers/call_provider.dart';
import 'package:video_conference/temp/user_data.dart';
import 'package:video_conference/widgets/closed_caption_card.dart';
import 'package:video_conference/widgets/double_participant_card.dart';
import 'package:video_conference/widgets/multiple_participant_card.dart';
import '../widgets/call_action_bar.dart';
import '../widgets/call_header.dart';
import '../widgets/screen_share.dart';
import 'package:go_router/go_router.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key, required this.single});

  // Act as a flag to determine call mode (1-1 or group)
  final bool single;

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  _onLeaveCall(BuildContext context) {
    context.read<CallProvider>().toggleCall();
    if (context.mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Consumer<CallActionProvider>(builder: (context, value, child) {
                if (!value.isCaptionFullScreen) {
                  return CallHeader(
                    name: user2.username,
                    description: user2.description,
                    imgUrl: user2.imgUrl,
                    onLeaveCall: () => _onLeaveCall(context),
                  );
                }
                return Container();
              }),
              // Body
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Screen share
                      Consumer<CallActionProvider>(
                          builder: (context, value, child) {
                        if (!value.isShareScreen) return Container();
                        return const Expanded(
                          flex: 2,
                          child: ScreenShare(),
                        );
                      }),

                      const SizedBox(height: 12),

                      // Participant
                      // TODO: Uplift user data to user controller
                      Expanded(
                        flex: 1,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          // Return single participant Card for 1-1 call and multiple participant card for group call
                          /// TODO: Create a provider to manage participants state
                          /// TODO: Switch widget to [SingleParticipantCard] if there is only 1 user in the room
                          child: widget.single
                              ? DoubleParticipantCard(
                                  user1: user1,
                                  user2: user2,
                                )
                              : MultipleParticipantCard(
                                  users: [user2, user3, user2, user3],
                                ),
                        ),
                      ),

                      Consumer<CallActionProvider>(
                          builder: (context, value, child) {
                        if (!value.isCaptionOn) return Container();
                        return Expanded(
                          flex: value.isCaptionFullScreen ? 3 : 1,
                          child: const ClosedCaptionContainer(),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              // Action buttons
              const CallActionBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClosedCaptionContainer extends StatelessWidget {
  const ClosedCaptionContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CallActionProvider>(builder: (context, value, child) {
      if (value.isCaptionOn) return const ClosedCaptionCard();
      return Container();
    });
  }
}
