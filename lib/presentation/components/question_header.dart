import 'dart:math';
import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/classes/question_classes.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    Key? key,
    required this.question,
    this.width,
  }) : super(key: key);

  final double? width;
  final Question question;

  @override
  Widget build(BuildContext context) {
    const double avatarWidth = 40;

    width ?? MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,
      child: LayoutBuilder(
        builder: (context, constrains) {
          final TextPainter textPainter = TextPainter(
            text: TextSpan(
              text: question.questionCategorie.categorieName,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            textDirection: TextDirection.ltr,
          );
          textPainter.layout();

          final double textWidth = textPainter.width;

          bool isSingleRun = textWidth + 2*avatarWidth < constrains.maxWidth;


          return Wrap(
            verticalDirection: VerticalDirection.up,
            alignment:
                isSingleRun ? WrapAlignment.spaceBetween : WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const SizedBox(
                width: 0,
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.only(left:max(min(40, constrains.maxWidth-avatarWidth-textWidth),0)),
                child: Text(
                  question.questionCategorie.categorieName,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/questioncategories/${question.questionCategorie.categorieName}.png'),
                radius: avatarWidth / 2,
              )
            ],
          );
        },
      ),
    );
  }
}
