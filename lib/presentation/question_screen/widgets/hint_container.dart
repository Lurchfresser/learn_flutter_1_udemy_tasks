import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';

class HintContainer extends StatefulWidget {
  final Question question;

  const HintContainer({super.key, required this.question});

  @override
  State<HintContainer> createState() => _HintContainerState();
}

class _HintContainerState extends State<HintContainer> {
  int _hintStage = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _hintStage = (++_hintStage) % 4;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: [
            const Icon(
              Icons.help_outline_rounded,
              color: Colors.white,
              size: 50,
            ),
            const SizedBox(
              width: 12,),
            Flexible(
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: _hintStage == 3 ? 1.0 : 0.0,
                      child: Text(
                        widget.question.questionAnswer,
                      ),
                    ),
                    Opacity(
                      opacity: _hintStage == 2 ? 1.0 : 0.0,
                      child: Text(
                        widget.question.secondHint,
                      ),
                    ),
                    Opacity(
                      opacity: _hintStage == 1 ? 1.0 : 0.0,
                      child: Text(
                        widget.question.firstHint,
                      ),
                    ),
                    Container(
                      color: Colors.blue.withOpacity(_hintStage == 0 ? 1.0 : 0.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
