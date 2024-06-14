import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/temp/user_data.dart';
import 'package:video_conference/widgets/closed_caption_card.dart';
import 'package:video_conference/widgets/double_participant_card.dart';
import '../widgets/call_action_bar.dart';
import '../widgets/call_header.dart';

class SingleCallPage extends StatefulWidget {
  const SingleCallPage({super.key});

  @override
  State<SingleCallPage> createState() => _SingleCallPageState();
}

class _SingleCallPageState extends State<SingleCallPage> {
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
              Consumer<CallActionProvider>(builder: (context, value, child) {
                if (!value.isCaptionFullScreen) {
                  return CallHeader(
                    name: user2.username,
                    description: user2.description,
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
                      // TODO: Uplift user into [UserProvider]
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: DoubleParticipantCard(
                            user1: user1,
                            user2: user2,
                          ),
                        ),
                      ),

                      Consumer<CallActionProvider>(
                          builder: (context, value, child) {
                        if (value.isCaptionOn) {
                          return Expanded(
                            flex: value.isCaptionFullScreen ? 3 : 1,
                            child: ClosedCaptionContainer(),
                          );
                        }
                        return Container();
                      }),
                    ],
                  ),
                ),
              ),
              // Action buttons
              CallActionBar(),
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
      if (value.isCaptionOn) return ClosedCaptionCard();
      return Container();
    });
  }
}
