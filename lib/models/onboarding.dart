class OnboardingModel {
  final String lottieFile;
  final String title;
  final String subtitle;

  OnboardingModel(this.lottieFile, this.title, this.subtitle);
}

List<OnboardingModel> tabs = [
  OnboardingModel(
    'assets/plant.json',
    'Learn JawaBot',
    'When you order Eat Street , \nwe\'ll hook you up with exclusive \ncoupons.',
  ),
  OnboardingModel(
    'assets/people-jump.json',
    'Study Together',
    'We make it simple to find the \nfood you crave. Enter your \naddress and let',
  ),
  OnboardingModel(
    'assets/chat-bubble.json',
    'Chat with JawaBot',
    'We make food ordering fast ,\n simple and free - no matter if you \norder',
  ),
];
