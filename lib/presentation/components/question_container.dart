import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/components/question_header.dart';

class QuestionContainer extends StatelessWidget {
  final Question question;
  final void Function()? onTap;

  const QuestionContainer({super.key, required this.question, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: question.questionCategorie.color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: QuestionHeader(question: question)
                ),
              const SizedBox(
                height: 10,
              ),
              Text(question.questionText, style: Theme.of(context).textTheme.bodyMedium,),
            ],
          ),
        ),
      ),
    );
  }
}


