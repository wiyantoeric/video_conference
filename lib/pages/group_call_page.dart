import 'package:flutter/material.dart';

class GroupCallPage extends StatelessWidget {
  const GroupCallPage({super.key});

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
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              Container(
                height: 120,
                child: Text('data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
