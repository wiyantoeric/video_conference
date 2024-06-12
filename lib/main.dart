import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/providers/call_action_provider.dart';
import 'package:video_conference/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CallActionProvider()),
      ],
      child: const VideoConferenceApp(),
    ),
  );
}

class VideoConferenceApp extends StatelessWidget {
  const VideoConferenceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Video Conference',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
