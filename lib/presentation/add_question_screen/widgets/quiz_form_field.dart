import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class QuizFormField extends StatelessWidget {
  final String inputName;
  final double width;

   const QuizFormField({
    super.key,
    this.width = 300,
    required this.inputName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FormBuilderTextField(
        name: inputName,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: "Enter your $inputName",
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a $inputName';
          }
          else if(value.length > 250){
            return 'Character count must not exceed 250 characters';
          }
          return null;
        },
      ),
    );
  }
}