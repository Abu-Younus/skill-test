import 'package:flutter/material.dart';
import 'package:skill_test/models/skill_master.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

void main() {
  runApp(const SkillTestApp());
}

class SkillTestApp extends StatelessWidget {
  const SkillTestApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SkillMaster skillMaster = SkillMaster();
  var winCount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Center(
          child: Text('Question: ${skillMaster.questionIndex + 1}\/${skillMaster.skillTesterList.length}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    skillMaster.getQuestionText() ?? '',
                    style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {});
                    if(skillMaster.getQuestionAnswerText() == true) {
                      skillMaster.addCorrectAnswer();
                      skillMaster.nextQuestion();
                    }
                    else {
                      skillMaster.addWrongAnswer();
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Wrong Answer',
                        desc: 'Correct Answer: ${skillMaster.getQuestionAnswerText()}',
                        btnOkOnPress: () {
                          setState(() {

                          });
                          skillMaster.nextQuestion();
                        },
                      )..show();
                    }

                    winCount = (skillMaster.skillTesterList.length * 70) / 100;

                    if(skillMaster.questionCount + 1 > skillMaster.skillTesterList.length) {
                      if(skillMaster.totalCorrectAnswer >= winCount) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'You Win!',
                          btnOkOnPress: () {
                            setState(() {

                            });
                            skillMaster.playAgain();
                          },
                        )..show();
                      }
                      else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Game Over',
                          desc: 'Try Again',
                          btnOkOnPress: () {
                            setState(() {

                            });
                            skillMaster.playAgain();
                          },
                        )..show();
                      }
                    }
                  },
                      child: Text('True',style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(onPressed: (){
                    setState(() {});
                    if(skillMaster.getQuestionAnswerText() == false) {
                      skillMaster.addCorrectAnswer();
                      skillMaster.nextQuestion();
                    }
                    else {
                      skillMaster.addWrongAnswer();
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Wrong Answer',
                        desc: 'Correct Answer: ${skillMaster.getQuestionAnswerText()}',
                        btnOkOnPress: () {
                          setState(() {

                          });
                          skillMaster.nextQuestion();
                        },
                      )..show();
                    }

                    winCount = (skillMaster.skillTesterList.length * 70) / 100;

                    if(skillMaster.questionCount + 1 > skillMaster.skillTesterList.length) {
                      if(skillMaster.totalCorrectAnswer >= winCount) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'You Win!',
                          btnOkOnPress: () {
                            setState(() {

                            });
                            skillMaster.playAgain();
                          },
                        )..show();
                      }
                      else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Game Over',
                          desc: 'Try Again',
                          btnOkOnPress: () {
                            setState(() {

                            });
                            skillMaster.playAgain();
                          },
                        )..show();
                      }
                    }

                  },
                    child: Text('False',style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Right: ${skillMaster.totalCorrectAnswer}',style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold
                    ),),
                    Text('Wrong: ${skillMaster.totalWrongAnswer}',style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}