import 'package:flutter/material.dart';
import 'development_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'title': 'Welcome!',
      'subtitle':
          'BondTime helps you track and enhance your child\'s development in a fun way.',
    },
    {
      'title': 'Track Progress',
      'subtitle':
          'Keep a record of your child\'s milestones and daily activities.',
    },
    {
      'title': 'Let\'s Get Started',
      'subtitle':
          'We’ll guide you through simple steps to support your child’s growth.',
    },
  ];

  void _onDone() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const DevelopmentScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemCount: _onboardingData.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blue.shade50,
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _onboardingData[index]['title']!,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  _onboardingData[index]['subtitle']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 40),
                if (index == _onboardingData.length - 1)
                  ElevatedButton(
                    onPressed: _onDone,
                    child: const Text('Done'),
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: const Text('Next'),
                  ),
              ],
            ),
          );
        },
      ),
      bottomSheet: _currentPage < _onboardingData.length - 1
          ? TextButton(
              onPressed: _onDone,
              child: const Text('Skip',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            )
          : const SizedBox.shrink(),
    );
  }
}
