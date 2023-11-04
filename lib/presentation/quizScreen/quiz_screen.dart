import 'dart:math';
import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/components/floating_add_and_remove.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/components/question_container.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/question_screen/question_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> displayedQuestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingAddAndRemove(add: () {
        setState(() {
          if (questions.isEmpty) return;
          Random random = Random();
          int index =
              questions.length == 1 ? 0 : random.nextInt(questions.length - 1);
          displayedQuestions.add(questions.removeAt(index));
        });
      }, remove: () {
        setState(() {
          if (displayedQuestions.isEmpty) return;
          int index = displayedQuestions.length - 1;
          questions.add(displayedQuestions.removeAt(index));
        });
      }),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                if (displayedQuestions.isEmpty) return;
                Random random = Random();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                            question: displayedQuestions[random
                                .nextInt(displayedQuestions.length - 1)])));
              },
              icon: const Icon(Icons.question_mark_outlined),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: displayedQuestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    Question question = displayedQuestions[index];

                    return Hero(
                      tag: question.questionText,
                      child: QuestionContainer(
                        question: question,
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuestionScreen(question: question))),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                        height: 10,
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
