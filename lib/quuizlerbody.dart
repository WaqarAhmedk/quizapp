import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizlerBody extends StatefulWidget {
  @override
  _QuizlerBodyState createState() => _QuizlerBodyState();
}

class _QuizlerBodyState extends State<QuizlerBody> {
  List<Widget> ScoreKeeper = [];
  void checkanswers(bool useranswer) {
    setState(() {
      if (quizBrain.checkcompletion() == true) {
        Alert(context: context, title: "asa").show();
        quizBrain.reset();
        ScoreKeeper.clear();

        print("completed");
      } else {
        if (useranswer == quizBrain.GetAnswers()) {
          ScoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          ScoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.NextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Text(
                quizBrain.getQuestions(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Expanded(
          flex: 0,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                checkanswers(true);
              },
              child: Text(
                "True",
                style: TextStyle(color: Colors.white),
              )),
        ),
        Expanded(
          flex: 0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            onPressed: () {
              checkanswers(false);
            },
            child: Text(
              "False",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Row(
            children: ScoreKeeper,
          ),
        ),
      ],
    );
  }
}
