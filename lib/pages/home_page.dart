import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_guard/permission_guard.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/model/user.dart';
import 'package:video_conference/providers/user_provider.dart';
import 'package:video_conference/temp/user_data.dart';
import 'package:video_conference/utils/permissions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _usernameController = TextEditingController();

  bool validateUsername(String username) {
    return username.isNotEmpty;
  }

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
                controller: _usernameController,
              ),
              SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (!validateUsername(_usernameController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a valid username'),
                            ),
                          );
                          return;
                        }

                        user1.username = _usernameController.text;
                        context.go('/call/single');
                      },
                      child: Text('1-1'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: () {
                        if (!validateUsername(_usernameController.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please enter a valid username'),
                            ),
                          );
                          return;
                        }

                        user1.username = _usernameController.text;
                        context.go('/call/group');
                      },
                      child: Text('Group'),
                    ),
                  ),
                  SizedBox(width: 10),
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
