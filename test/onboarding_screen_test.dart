import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:job2main/features/authentication/screens/onboarding/onboarding.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:job2main/utils/constants/text_strings.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('OnboardingScreen displays all main components', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: OnboardingScreen()));

    expect(find.byType(OnBoardingSkip), findsOneWidget);
    expect(find.byType(OnBoardingDotNavigation), findsOneWidget);
    expect(find.byType(OnBoardingNextButton), findsOneWidget);

    expect(find.text(TTexts.onBoardingTitle1), findsOneWidget);
    await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000);
    await tester.pumpAndSettle();
    
    expect(find.text(TTexts.onBoardingTitle2), findsOneWidget);
    await tester.fling(find.byType(PageView), const Offset(-400.0, 0.0), 1000);
    await tester.pumpAndSettle();
    
    expect(find.text(TTexts.onBoardingTitle3), findsOneWidget);
  });
}
