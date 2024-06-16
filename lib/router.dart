import 'package:go_router/go_router.dart';
import 'package:video_conference/pages/call_page.dart';
import 'package:video_conference/pages/home_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/call/single',
      builder: (context, state) => const CallPage(single: true),
    ),
    GoRoute(
      path: '/call/group',
      builder: (context, state) => const CallPage(single: false),
    ),
  ],
);
