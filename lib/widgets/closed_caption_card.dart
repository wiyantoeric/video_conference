import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/temp/caption_data.dart';

import 'user_caption_row.dart';

class ClosedCaptionCard extends StatefulWidget {
  const ClosedCaptionCard({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
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
                    const Text('Transcript'),
                    Consumer<CallActionProvider>(
                        builder: (context, value, child) {
                      if (value.isCaptionFullScreen) {
                        return IconButton(
                          onPressed: () => value.toggleCaptionFullScreen(),
                          icon: const Icon(Icons.close_fullscreen),
                        );
                      } else {
                        return IconButton(
                          onPressed: () => value.toggleCaptionFullScreen(),
                          icon: const Icon(Icons.open_in_full),
                        );
                      }
                    }),
                  ],
                ),
                const Divider(),
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
