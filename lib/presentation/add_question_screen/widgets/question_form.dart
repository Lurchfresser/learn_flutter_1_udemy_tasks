import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learn_flutter_1_udemy_tasks/presentation/add_question_screen/widgets/quiz_form_field.dart';

class QuestionForm extends StatefulWidget {
  const QuestionForm({super.key});

  @override
  State<QuestionForm> createState() => QuestionFormState();
}

class QuestionFormState extends State<QuestionForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formKey,
          child: const Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              QuizFormField(
                inputName: "question",
              ),
              QuizFormField(
                inputName: "answer",
              ),
              QuizFormField(
                inputName: "first hint",
              ),
              QuizFormField(
                inputName: "second hint",
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ElevatedButton(
            onPressed: () {
              _formKey.currentState!.save();
              if (_formKey.currentState!.validate()) {
                final formData = _formKey.currentState?.value;
                print(formData);
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
