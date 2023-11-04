import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/components/question_container.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/question_screen/widgets/hint_container.dart';



class QuestionScreen extends StatelessWidget {
  final Question question;

  const QuestionScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question Screen"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Hero(
              tag: question.questionText,
              child: QuestionContainer(
            question: question,
            onTap: () => Navigator.pop(context),
          )),
          const SizedBox(height: 70,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: HintContainer(question: question),
        ),
        ],
      ),
    );
  }
}
