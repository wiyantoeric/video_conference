import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/model/caption.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/temp/caption_data.dart';
import 'package:video_conference/temp/user_data.dart';

class ClosedCaptionCard extends StatefulWidget {
  ClosedCaptionCard({
    super.key,
  });

  @override
  State<ClosedCaptionCard> createState() => _ClosedCaptionCardState();
}

class _ClosedCaptionCardState extends State<ClosedCaptionCard> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent + 50,
      duration: Duration(milliseconds: 0),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        // Caption container
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 12, 12, 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transcript'),
                    Consumer<CallActionProvider>(
                        builder: (context, value, child) {
                      if (value.isCaptionFullScreen) {
                        return IconButton(
                          onPressed: () => value.toggleCaptionFullScreen(),
                          icon: Icon(Icons.close_fullscreen),
                        );
                      } else {
                        return IconButton(
                          onPressed: () => value.toggleCaptionFullScreen(),
                          icon: Icon(Icons.open_in_full),
                        );
                      }
                    }),
                  ],
                ),
                Divider(),
                Expanded(
                  child: ListView.separated(
                    itemCount: captions.length,
                    reverse: true,
                    separatorBuilder: (_, index) => const SizedBox(height: 12),
                    itemBuilder: (_, index) {
                      return UserCaptionRow(
                        caption: captions[captions.length - index - 1],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserCaptionRow extends StatelessWidget {
  const UserCaptionRow({
    super.key,
    required this.caption,
  });

  final Caption caption;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pfp
        SizedBox(
          width: 24,
          height: 36,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.asset(
              caption.user.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12),
        // Caption row
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(caption.user.username),
              SizedBox(height: 4),
              Text(
                caption.text,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
