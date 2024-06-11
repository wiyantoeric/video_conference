import 'package:flutter/material.dart';

class CallHeader extends StatelessWidget {
  const CallHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          // Pfp
          SizedBox(
            width: 40,
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image.asset(
                'assets/images/pfp_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12),
          // Group / called person description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Caller',
                ),
                Text(
                  'Description',
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
