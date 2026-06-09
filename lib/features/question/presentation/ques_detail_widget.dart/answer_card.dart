import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stackhive/features/question/presentation/ques_detail_widget.dart/showAnswerActions.dart';
import 'package:stackhive/features/setting/presentation/about_ai_answer.dart';
import 'package:stackhive/models/answer_model.dart';
import 'package:stackhive/models/question_model.dart';

class AnswerCard extends ConsumerWidget {
  final String questionId;
  final QuestionModel question;
  final AnswerModel answer;
  final AsyncValue<int?> voteAsync;

  final bool isAnswerOwner;
  final bool isQuestionOwner;
  final bool canDelete;

  const AnswerCard({
    super.key,
    required this.questionId,
    required this.question,
    required this.answer,
    required this.voteAsync,
    required this.isAnswerOwner,
    required this.isQuestionOwner,
    required this.canDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: answer.isAiAnswer
            ? theme.colorScheme.primary.withOpacity(.05)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
            color: answer.isAiAnswer
                ? theme.colorScheme.primary.withOpacity(.35)
                : theme.colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI HEADER
          if (answer.isAiAnswer) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: (_) => const AboutAiAnswer())
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 7, left: 2),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withOpacity(.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.auto_awesome,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "AI Answer",
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    showAnswerActions(
                      context,
                      ref,
                      question,
                      answer,
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 14, width: 10,),

            Text(
              answer.content,
              style: theme.textTheme.bodyMedium,
            ),
          ]
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Expanded(
                  child: Text(
                    answer.content,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    showAnswerActions(
                      context,
                      ref,
                      question,
                      answer,
                    );
                  },
                ),
              ],
            ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// VOTES
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.how_to_vote_outlined,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Votes: ${answer.voteCount}',
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ),

              // BEST ANSWER BADGE
              if (answer.isBestAnswer)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(.12),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Best Answer',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
