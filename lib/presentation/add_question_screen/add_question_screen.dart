import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/add_question_screen/widgets/question_form.dart';

class AddQuestionScreen extends StatelessWidget {
  const AddQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: QuestionForm(),
    );
  }
}