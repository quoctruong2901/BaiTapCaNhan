import 'package:flutter/material.dart';
import '../models/onboard_page.dart';

class OnboardContent extends StatelessWidget {
  final OnboardPage page;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final bool isLast;

  const OnboardContent({
    super.key,
    required this.page,
    this.onNext,
    this.onBack,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(page.image, height: 250),
            const SizedBox(height: 40),
            Text(
              page.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              page.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
            const Spacer(),

            // ---- Nút điều hướng ----
            if (onBack != null)
              // Có nút back → dùng Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BACK
                  InkWell(
                    onTap: onBack,
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 48,
                      width: 48,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),

                  // NEXT hoặc GET STARTED
                  OnboardButton(
                    text: isLast ? 'Get Started' : 'Next',
                    onPressed: onNext,
                  ),
                ],
              )
            else
              // Không có nút back → căn giữa nút Next
              Center(
                child: OnboardButton(
                  text: isLast ? 'Get Started' : 'Next',
                  onPressed: onNext,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Widget riêng cho nút Next / Get Started
class OnboardButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const OnboardButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
