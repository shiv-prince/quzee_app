import 'package:flutter/material.dart';
import 'package:quzee_app/bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

Bank bank = Bank();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quizee"),
          backgroundColor: Colors.grey.shade700,
        ),
        backgroundColor: Colors.grey.shade400,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKepper = [];

  void seticonstrue() {
    ScoreKepper.add(
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
    if (quizeindex + 1 < bank.question.length) {
      quizeindex++;
    } else {
      Alert(
        context: context,
        title: "ALERT",
        desc: "Thakyou..! \n The Quiz as been Completed.",
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                ScoreKepper.clear();
                quizeindex = 0;
                Navigator.pop(context);
              });
            },
            width: 220,
            child: const Text(
              "Retake Quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
      ScoreKepper.clear();
    }
  }

  void seticonsflase() {
    ScoreKepper.add(
      const Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
    if (quizeindex + 1 < bank.question.length) {
      quizeindex++;
    } else {
      Alert(
        context: context,
        title: "ALERT",
        desc: "Thakyou..! \n The Quiz as been Completed.",
        buttons: [
          DialogButton(
            onPressed: () {
              setState(() {
                ScoreKepper.clear();
                quizeindex = 0;
                Navigator.pop(context);
              });
            },
            width: 220,
            child: const Text(
              "Retake Quiz",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ).show();
      ScoreKepper.clear();
    }
  }

  int quizeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              bank.question[quizeindex].qname,
            ),
          )),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                setState(() {
                  bool restul = true;
                  if (restul == bank.question[quizeindex].qresult) {
                    seticonstrue();
                  } else {
                    seticonsflase();
                  }
                });
              },
              child: const Text("True"),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                setState(() {
                  bool restul = false;
                  if (restul == bank.question[quizeindex].qresult) {
                    seticonstrue();
                  } else {
                    seticonsflase();
                  }
                });
              },
              child: const Text("False"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ScoreKepper,
          ),
        ),
      ],
    );
  }
}
