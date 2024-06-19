import 'package:flutter/material.dart';

class CallHeader extends StatelessWidget {
  const CallHeader({
    super.key,
    required this.name,
    required this.onLeaveCall,
    this.description = '',
    // Set default image from local image
    this.imgUrl = 'assets/images/pfp_3.jpg',
  });

  final String name;
  final String? description;
  final String? imgUrl;
  final VoidCallback onLeaveCall;

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
                imgUrl ?? 'assets/images/pfp_3.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Group / called person description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(description ?? ''),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onLeaveCall(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
