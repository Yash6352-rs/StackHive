import 'package:flutter/material.dart';
import 'package:stackhive/core/theme/app_colors.dart';

class AboutAiAnswer extends StatelessWidget {
  const AboutAiAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final items = [
      InfoItem(
        icon: Icons.auto_awesome_outlined,
        title: 'What is AI Answer?',
        description:
            'AI Answer is an automatically generated response created using artificial intelligence when a new question is posted on StackHive.',
      ),
      InfoItem(
        icon: Icons.flash_on_outlined,
        title: 'Instant Assistance',
        description:
            'AI Answers are generated shortly after a question is created, helping users receive quick guidance before community members respond.',
      ),
      InfoItem(
        icon: Icons.school_outlined,
        title: 'Learning Support',
        description:
            'AI-generated responses can provide explanations, troubleshooting tips, coding guidance, and general knowledge related to the question.',
      ),
      InfoItem(
        icon: Icons.people_outline,
        title: 'Community Collaboration',
        description:
            'AI Answers do not replace community contributions. Users can still post answers, vote, discuss solutions, and select the best answer.',
      ),
      InfoItem(
        icon: Icons.thumb_up_alt_outlined,
        title: 'Voting & Feedback',
        description:
            'AI Answers participate in the same voting system as regular answers. Community feedback helps highlight useful responses.',
      ),
      InfoItem(
        icon: Icons.emoji_events_outlined,
        title: 'Best Answer Eligibility',
        description:
            'AI-generated answers can be marked as Best Answer if they accurately solve the problem and provide the most helpful solution.',
      ),
      InfoItem(
        icon: Icons.fact_check_outlined,
        title: 'Accuracy Notice',
        description:
            'While AI strives to provide helpful information, responses may occasionally be incomplete, outdated, or incorrect.',
      ),
      InfoItem(
        icon: Icons.shield_outlined,
        title: 'Responsible Usage',
        description:
            'Always review AI-generated information carefully, especially for technical, security, or business-critical decisions.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.brightness == Brightness.dark
          ? AppColors.darkBackground
          : AppColors.lightBackground,
          elevation: 0,
          title: const Text("About AI Answers", style: TextStyle(fontWeight: FontWeight.w700)),
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          /// INTRO CARD
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              "StackHive AI Answers provide automatically generated responses to newly created questions. They are designed to help users receive quick guidance while waiting for community contributions.",
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),

          /// INFO CARDS
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: _InfoCard(item: item),
            ),
          ),
          const SizedBox(height: 8),

          /// FINAL WARNING CARD
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(.08),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(.2)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text("Use AI Responsibly",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                Text("AI Answers are intended to assist and guide users, not replace critical thinking or expert judgment. Always verify important information, test technical solutions, and consider community feedback before acting on AI-generated content.",
                  style: theme.textTheme.bodyMedium?.copyWith(height: 1.4),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
  
}

class _InfoCard extends StatelessWidget {
  final InfoItem item;

  const _InfoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ICON
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, size: 18, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 14),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 4),

                Text(
                  item.description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodySmall?.color,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem {
  final IconData icon;
  final String title;
  final String description;

  InfoItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}