import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
              Text(
                'Username',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 32),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () => context.go('/call/single'),
                      child: Text('1-1'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: () => context.go('/call/group'),
                      child: Text('Group'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
