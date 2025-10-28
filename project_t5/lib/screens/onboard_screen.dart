import 'package:flutter/material.dart';
import '../models/onboard_page.dart';
import '../widgets/onboard_content.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final List<OnboardPage> pages = [
    OnboardPage(
      title: 'Easy Time Management',
      description:
          'With management based on priority and daily tasks, it will give you convenience in managing and determining what tasks must be done first.',
      image: 'assets/images/onboard01.png',
      buttonText: 'Next',
    ),
    OnboardPage(
      title: 'Increase Work Effectiveness',
      description:
          'Time management and determining important tasks gives your job better results and improvement.',
      image: 'assets/images/onboard02.png',
      buttonText: 'Next',
    ),
    OnboardPage(
      title: 'Reminder Notification',
      description:
          'This application reminds you of assignments and notifies according to the time you have set.',
      image: 'assets/images/onboard03.png',
      buttonText: 'Get Started',
    ),
  ];

  int currentIndex = 0;

  void nextPage() {
    if (currentIndex < pages.length - 1) {
      setState(() => currentIndex++);
    } else {
      // Khi bấm "Get Started" → quay lại trang đầu tiên
      setState(() {
        currentIndex = 0;
      });
    }
  }

  void backPage() {
    if (currentIndex > 0) {
      setState(() => currentIndex--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = pages[currentIndex];
    return Scaffold(
      body: OnboardContent(
        page: page,
        onNext: nextPage,
        onBack: currentIndex > 0 ? backPage : null,
        isLast: currentIndex == pages.length - 1,
      ),
    );
  }
}
