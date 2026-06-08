import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerModel {
  final String id;
  final String questionId;
  final String userId;
  final String content;
  final int voteCount;
  final bool isBestAnswer;
  final Timestamp createdAt;
  final bool isAiAnswer;

  const AnswerModel({
    required this.id,
    required this.questionId,
    required this.userId,
    required this.content,
    required this.voteCount,
    required this.isBestAnswer,
    required this.createdAt, 
    required this.isAiAnswer
  });

  // Convert Firestore → Model
  factory AnswerModel.fromMap(Map<String, dynamic> map, String documentId) {
    return AnswerModel(
      id: documentId,
      questionId: map['questionId'] ?? '',
      userId: map['userId'] ?? '',
      content: map['content'] ?? '',
      voteCount: map['voteCount'] ?? 0,
      isBestAnswer: map['isBestAnswer'] ?? false,
      createdAt: map['createdAt'] ?? Timestamp.now(),
      isAiAnswer: map['isAiAnswer'] ?? false,
    );
  }

  // Convert Model → Firestore
  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'userId': userId,
      'content': content,
      'voteCount': voteCount,
      'isBestAnswer': isBestAnswer,
      'createdAt': createdAt,
      'isAiAnswer': isAiAnswer,
    };
  }

  // CopyWith (important for vote updates)
  AnswerModel copyWith({
    String? id,
    String? questionId,
    String? userId,
    String? content,
    int? voteCount,
    bool? isBestAnswer,
    Timestamp? createdAt,
    bool? isAiAnswer,
  }) {
    return AnswerModel(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      userId: userId ?? this.userId,
      content: content ?? this.content,
      voteCount: voteCount ?? this.voteCount,
      isBestAnswer: isBestAnswer ?? this.isBestAnswer,
      createdAt: createdAt ?? this.createdAt, 
      isAiAnswer: isAiAnswer ?? this.isAiAnswer,
    );
  }
  
}

/*
Immutable
Safe null defaults
Ready for Firestore
Ready for voting updates
eady for best answer logic
*/