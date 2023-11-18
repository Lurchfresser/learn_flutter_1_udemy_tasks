import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';
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
        FormBuilder(
          key: _formKey,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              const QuizFormField(
                inputName: "question",
              ),
              const QuizFormField(
                inputName: "answer",
              ),
              const QuizFormField(
                inputName: "first hint",
              ),
              const QuizFormField(
                inputName: "second hint",
              ),
              FormBuilderDropdown(
                name: "Question categorie", 
                isExpanded: false,
                items: [
                for (QuestionCategorie categorie in QuestionCategorie.values)
                  DropdownMenuItem(
                    value: categorie,
                    child: Text(categorie.categorieName),
                    // Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     CircleAvatar(
                    //       backgroundImage: AssetImage(
                    //           'assets/questioncategories/${categorie.categorieName}.png'),
                    //       radius: 10,
                    //     ),
                    //     Text(categorie.categorieName),
                    //   ],
                    // ),
                  )
              ])
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
                final question = Question(
                  questionText: formData?['question'],
                  firstHint: formData?['first hint'],
                  secondHint: formData?['second hint'],
                  questionAnswer: formData?['answer'],
                  questionCategorie: formData?['Question categorie'],
                );
                questions.add(question);
              }
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}
