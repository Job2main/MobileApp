import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job2main/features/authentication/screens/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:job2main/utils/constants/text_strings.dart';

void main() {
  testWidgets('OnboardingScreen allows page navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: OnboardingScreen()));

    expect(find.text(TTexts.onBoardingTitle1), findsOneWidget);

    await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000);
    await tester.pumpAndSettle();

    expect(find.text(TTexts.onBoardingTitle2), findsOneWidget);

    await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000);
    await tester.pumpAndSettle();

    expect(find.text(TTexts.onBoardingTitle3), findsOneWidget);
  });
}
