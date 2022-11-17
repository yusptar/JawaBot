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
    'Mempelajari aplikasi edukasi sejarah dengan fitur yang unik',
  ),
  OnboardingModel(
    'assets/people-jump.json',
    'Study Together',
    'Belajar sejarah bersama melalui JawaBot.',
  ),
  OnboardingModel(
    'assets/chat-bubble.json',
    'Chat with JawaBot',
    'Ketik keyword untuk menampilkan list topik chat.',
  ),
];
