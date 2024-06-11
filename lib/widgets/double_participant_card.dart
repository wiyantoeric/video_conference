import 'package:flutter/material.dart';

import 'participant_card.dart';

class DoubleParticipantCard extends StatefulWidget {
  DoubleParticipantCard({
    super.key,
    required this.isMicOn,
    required this.isVideoOn,
  });

  bool isMicOn;
  bool isVideoOn;

  @override
  State<DoubleParticipantCard> createState() => _DoubleParticipantCardState();
}

class _DoubleParticipantCardState extends State<DoubleParticipantCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ParticipantCard(
              imgUrl: 'assets/images/pfp_1.jpg',
              isMicOn: widget.isMicOn,
              isVideoOn: false,
            ),
            SizedBox(width: 4),
            Icon(Icons.radio),
            SizedBox(width: 4),
            ParticipantCard(
              imgUrl: 'assets/images/pfp_2.jpg',
              isMicOn: false,
              isVideoOn: false,
            ),
          ],
        ),
        // May require cc posts : user desc, post content
        CcContainer(),
      ],
    );
  }
}

class CcContainer extends StatefulWidget {
  const CcContainer({super.key});

  @override
  State<CcContainer> createState() => _CcContainerState();
}

class _CcContainerState extends State<CcContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 12),
          // Cc container
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
                  UserCcPost(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserCcPost extends StatelessWidget {
  const UserCcPost({
    super.key,
  });

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
        // Post content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username'),
              SizedBox(height: 4),
              Text(
                'Oasdoiajwdoawjdoawndpawnodaxuhawoduxhbuowahxdwabhuxdoahdoxhwdbawuhxwadxwabxwaxhdohdowauxhwahxodwaoxh',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
