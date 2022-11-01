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
    'Example Text.',
  ),
  OnboardingModel(
    'assets/people-jump.json',
    'Study Together',
    'Example Text.',
  ),
  OnboardingModel(
    'assets/chat-bubble.json',
    'Chat with JawaBot',
    'Example Text.',
  ),
];
