import 'package:flutter/material.dart';
import 'package:video_conference/model/caption.dart';

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
        // User profile picture
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
        const SizedBox(width: 12),
        // Caption rows
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(caption.user.username),
              const SizedBox(height: 4),
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
