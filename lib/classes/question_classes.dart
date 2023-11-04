import 'package:flutter/material.dart';

enum QuestionCategorie {
  sports(color: Colors.grey, categorieName: "sports"),
  science(color: Colors.lightBlue, categorieName: "science"),
  celebrities(color: Colors.pink, categorieName: "celebreties");

  const QuestionCategorie({
    required this.color,
    required this.categorieName,
  });

  final Color color;
  final String categorieName;
}

class Question {
  final String questionText;
  final QuestionCategorie questionCategorie;
  final String questionAnswer;
  final String firstHint;
  final String secondHint;
  Question({required this.questionAnswer, required this.firstHint, required this.secondHint, required this.questionCategorie, required this.questionText});
}

List<Question> questions = [
  Question(
    questionCategorie: QuestionCategorie.sports,
    questionText: "Who won the first world cup?",
    questionAnswer: "The first FIFA World Cup was held in 1930, and the winner of that inaugural tournament was Uruguay. Uruguay defeated Argentina 4-2 in the final match to become the first World Cup champions. This historic event took place in Montevideo, Uruguay.",
    firstHint: "This country won the first FIFA World Cup in 1930, and they also won the 1950 World Cup.",
    secondHint: "The inaugural World Cup took place in South America, and the winning team defeated Argentina in the final match."
  ),
  Question(
    questionCategorie: QuestionCategorie.celebrities,
    questionText: "What Jonas brothers were Taylor Swift and Selena Gomez dating when they first met and became friends?",
    questionAnswer: "Taylor Swift and Selena Gomez were dating Joe Jonas and Nick Jonas, respectively, when they first met and became friends.",
    firstHint: "Taylor Swift was dating one of the Jonas brothers named Joe.",
    secondHint: "Selena Gomez was in a relationship with one of the Jonas brothers named Nick."
  ),
  Question(
    questionCategorie: QuestionCategorie.celebrities,
    questionText: "Who was the first of the Kardashian-Jenner sisters to become a billionaire?",
    questionAnswer: "Kylie Jenner was the first of the Kardashian-Jenner sisters to become a billionaire.",
    firstHint: "This member of the Kardashian-Jenner family is known for her successful cosmetics brand.",
    secondHint: "She achieved billionaire status at a young age."
  ),
  Question(
    questionCategorie: QuestionCategorie.celebrities,
    questionText: "What Hollywood actor played Muhammed Ali in the 2001 movie, Ali?",
    questionAnswer: "Will Smith portrayed Muhammed Ali in the 2001 movie, Ali.",
    firstHint: "The actor who played Ali is known for his roles in action and comedy films.",
    secondHint: "He is also a rapper and producer in addition to being an actor."
  ),
  Question(
    questionCategorie: QuestionCategorie.science,
    questionText: "How many bones are in the human body?",
    questionAnswer: "There are 206 bones in the adult human body.",
    firstHint: "Humans are born with more bones, but as they grow, some bones fuse together.",
    secondHint: "The number of bones in the human body varies with age."
  ),
  Question(
    questionCategorie: QuestionCategorie.science,
    questionText: "What is the hardest natural substance on Earth?",
    questionAnswer: "Diamond is the hardest natural substance on Earth.",
    firstHint: "This substance is often associated with engagement rings and jewelry.",
    secondHint: "It is formed deep within the Earth under extreme pressure and heat."
  ),
  Question(
    questionCategorie: QuestionCategorie.science,
    questionText: "Humans and chimpanzees share roughly how much DNA?",
    questionAnswer: "Humans and chimpanzees share approximately 98-99% of their DNA.",
    firstHint: "The genetic similarity between humans and chimpanzees is very high.",
    secondHint: "This shared DNA is one reason for the close evolutionary relationship between the two species."
  ),
  Question(
    questionCategorie: QuestionCategorie.sports,
    questionText: "Who is the highest run-scorer of all time in International cricket?",
    questionAnswer: "Sachin Tendulkar is the highest run-scorer of all time in International cricket.",
    firstHint: "This cricketer is often referred to as the 'Little Master.'",
    secondHint: "He is from India and is widely regarded as one of the greatest batsmen in the history of the sport."
  ),
  Question(
    questionCategorie: QuestionCategorie.sports,
    questionText: "In American Football, how many points do you score for a touchdown?",
    questionAnswer: "In American Football, you score 6 points for a touchdown.",
    firstHint: "A touchdown is a significant scoring play in American Football.",
    secondHint: "Additional points can be scored through field goals and extra point attempts."
  ),
  Question(
    questionCategorie: QuestionCategorie.sports,
    questionText: "How old was American professional tennis player Coco Gauff when she beat Venus Williams at Wimbledon in 2019?",
    questionAnswer: "Coco Gauff was 15 years old when she beat Venus Williams at Wimbledon in 2019.",
    firstHint: "She made headlines for her remarkable performance at a young age.",
    secondHint: "This victory marked the beginning of a promising tennis career."
  ),
];