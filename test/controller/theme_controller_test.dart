import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_calculator/controller/theme_controller.dart';

void main() {
  group('ThemeController Tests', () {
    test('Light Theme', () {
      ThemeController themeController = ThemeController();
      themeController.lightTheme();
      expect(themeController.isDark, false);
    });

    test('Dark Theme', () {
      ThemeController themeController = ThemeController();
      themeController.darkTheme();
      expect(themeController.isDark, true);
    });

    test('Switcher Controller Listener - Light Theme', () {
      ThemeController themeController = ThemeController();
      themeController.switcherController.value = true;
      // Verify that the listener changes the theme to light
    });

    test('Switcher Controller Listener - Dark Theme', () {
      ThemeController themeController = ThemeController();
      themeController.switcherController.value = false;
      // Verify that the listener changes the theme to dark
    });

    testWidgets('Switcher Controller Listener - UI Update',
        (WidgetTester tester) async {
      ThemeController themeController = ThemeController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ValueListenableBuilder<bool>(
              valueListenable: themeController.switcherController,
              builder: (context, value, child) {
                return Text(value ? 'Light Theme' : 'Dark Theme');
              },
            ),
          ),
        ),
      );

      // Initial UI state
      expect(find.text('Dark Theme'), findsOneWidget);

      // Simulate switching theme
      themeController.switcherController.value = true;
      await tester.pump();

      // Verify UI updates after theme switch
      expect(find.text('Light Theme'), findsOneWidget);
    });
  });
}
