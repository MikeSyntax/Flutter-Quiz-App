import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  //not needed because turnery-expression build
  //earlier been var but to restrictive
  /* Widget? activeScreen; */

  /* @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } */
  List<String> selectedAnswers = [];
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = 'result-screen';
      });
    }
  }

  var activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      activeScreen = /* const QuestionsScreen(); */ 'questions-screen';
    });
  }

  @override
  Widget build(context) {
//turnery
    /* final screenWidget = activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(); */
//or if condition
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget = const ResultsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 141, 6, 155),
                Color.fromARGB(255, 191, 17, 221),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          //Turnery-expression from above
          child: /* activeScreen */ screenWidget,
        ),
      ),
    );
  }
}
