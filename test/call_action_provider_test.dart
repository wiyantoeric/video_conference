import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:video_conference/providers/call_action_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Call action provider test', () {
    late CallActionProvider callActionProvider;

    Widget createCallActionBar() {
      return ChangeNotifierProvider<CallActionProvider>.value(
        value: callActionProvider,
        child: MaterialApp(
          home: Scaffold(
            body: Consumer<CallActionProvider>(
              builder: (context, value, child) {
                return IconButton.filledTonal(
                  onPressed: () {
                    value.toggleMic();
                    value.toggleVideo();
                    value.toggleCaption();
                    value.toggleCaptionFullScreen();
                    value.toggleShareScreen();
                  },
                  icon: const Icon(Icons.toggle_off),
                );
              },
            ),
          ),
        ),
      );
    }

    setUp(() {
      callActionProvider = CallActionProvider();
    });

    testWidgets('Provider should be able to toggle on/off',
        (WidgetTester tester) async {
      await tester.pumpWidget(createCallActionBar());

      final toggleMicButton = find.byIcon(Icons.toggle_off);

      expect(toggleMicButton, findsOneWidget);

      expect(callActionProvider.isMicOn, isFalse);
      expect(callActionProvider.isVideoOn, isFalse);
      expect(callActionProvider.isCaptionOn, isFalse);
      expect(callActionProvider.isCaptionFullScreen, isFalse);
      expect(callActionProvider.isShareScreen, isFalse);

      await tester.tap(toggleMicButton);
      await tester.pumpAndSettle();

      expect(callActionProvider.isMicOn, isTrue);
      expect(callActionProvider.isVideoOn, isTrue);
      expect(callActionProvider.isCaptionOn, isTrue);
      expect(callActionProvider.isCaptionFullScreen, isTrue);
      expect(callActionProvider.isShareScreen, isTrue);
    });
  });
}
