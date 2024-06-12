import 'package:flutter/material.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/temp/user_data.dart';

class ClosedCaptionCard extends StatelessWidget {
  const ClosedCaptionCard({
    super.key,
  });

  // TODO: Uplift

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 12),
          // Caption container
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 12, 12, 12),
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.open_in_full),
                      ),
                    ],
                  ),
                  Divider(),
                  UserCaptionRow(
                    user: user1,
                    caption:
                        'captioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaptioncaption',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserCaptionRow extends StatelessWidget {
  const UserCaptionRow({
    super.key,
    required this.user,
    required this.caption,
  });

  final User user;
  final String caption;

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
              'assets/images/pfp_1.jpg',
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
              Text(user.username),
              SizedBox(height: 4),
              Text(
                caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
