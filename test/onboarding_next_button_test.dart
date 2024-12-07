import 'package:flutter_test/flutter_test.dart';
import 'package:job2main/features/authentication/screens/onboarding/onboarding.dart';
import 'package:job2main/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:get/get.dart';
import 'package:job2main/utils/constants/text_strings.dart';

void main() {
  testWidgets('Onboarding Next Button navigates through pages', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(home: OnboardingScreen()));

    expect(find.text(TTexts.onBoardingTitle1), findsOneWidget);

    await tester.tap(find.byType(OnBoardingNextButton));
    await tester.pumpAndSettle();
    expect(find.text(TTexts.onBoardingTitle2), findsOneWidget);

    await tester.tap(find.byType(OnBoardingNextButton));
    await tester.pumpAndSettle();
    expect(find.text(TTexts.onBoardingTitle3), findsOneWidget);
  });
}
