import 'package:flutter/material.dart';

class ScreenShare extends StatelessWidget {
  const ScreenShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              'assets/images/pfp_3.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.open_in_full),
          ),
        ),
      ],
    );
  }
}
