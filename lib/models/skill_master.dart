import 'package:flutter/material.dart';
import 'package:skill_test/models/skill_tester.dart';

class SkillMaster{
  int _questionIndex = 0;
  int _questionCount = 0;
  int _totalCorrectAnswer = 0;
  int _totalWrongAnswer = 0;

  List<SkillTester> _skillTesterList = [
    SkillTester('Dhaka is the capital of Bangladesh?', true),
    SkillTester('Hindi are the official language of Bangladesh?', false),
    SkillTester('Ichamati River flows across the India-Bangladesh border?', true),
    SkillTester('Bengali is the national language of Bangladesh?', true),
    SkillTester('8 rivers are there in Dhaka?', false),
    SkillTester('Rupee is the currency of Bangladesh?', false),
    SkillTester('Islam is the main religion practiced in Bangladesh?', true),
    SkillTester('7 March, 1973 was the first election held in Bangladesh?', true),
    SkillTester('Oriental Magpie-robin is the national bird of Bangladesh?', true),
    SkillTester('The atomic number for lithium is 17?', false),
    SkillTester('The black box in a plane is black?', false),
    SkillTester('Alliumphobia is a fear of garlic?', true),
    SkillTester('Prince Harry is taller than Prince William?', false),
    SkillTester('Marrakesh is the capital of Morocco?', false),
    SkillTester('Waterloo has the greatest number of tube platforms in London?', true),
    SkillTester('The unicorn is the national animal of Scotland?', true),
    SkillTester('A is the most common letter used in the English language?', false),
    SkillTester('In Harry Potter, Draco Malfoy has no siblings?', false),
    SkillTester('Louis Walsh is older than Simon Cowell?', true),
    SkillTester('Monaco is the smallest country in the world?', false),
    SkillTester('A cara cara navel is a type of orange?', true),
    SkillTester('There are five different blood groups?', false),
    SkillTester('Cinderella was the first Disney princess?', false),
    SkillTester('Alexander Fleming discovered penicillin?', true),
    SkillTester('K is worth four points in Scrabble?', false),
    SkillTester('An octopus has three hearts?', true),
    SkillTester('Walt Disney holds the record for the most Oscars?', true),
    SkillTester('Venus is the hottest planet in the solar system?', true),
    SkillTester('Fish cannot blink?', true),
    SkillTester('Goldfish have a two second memory?', false),
  ];

  List<SkillTester> get skillTesterList => _skillTesterList;

  String? getQuestionText() => _skillTesterList[_questionIndex].questionText;

  int get questionIndex => _questionIndex;

  int get questionCount => _questionCount;

  bool? getQuestionAnswerText() => _skillTesterList[_questionIndex].answer;

  int get totalCorrectAnswer => _totalCorrectAnswer;

  int get totalWrongAnswer => _totalWrongAnswer;

  void nextQuestion() {
    if(_questionIndex < _skillTesterList.length - 1) {
      _questionIndex++;
      _questionCount++;
    }
    else if(_questionIndex == _skillTesterList.length - 1) {
      _questionCount++;
    }
  }

  void addCorrectAnswer() {
    if(_questionCount <= _skillTesterList.length - 1) {
      _totalCorrectAnswer = _totalCorrectAnswer + 1;
      print('right: $_totalCorrectAnswer');
    }
  }

  void addWrongAnswer() {
    if(_questionCount <= _skillTesterList.length - 1) {
      _totalWrongAnswer = _totalWrongAnswer + 1;
      print('wrong: $_totalWrongAnswer');
    }
  }

  void playAgain() {
    _questionIndex = 0;
    _questionCount = 0;
    _totalCorrectAnswer = 0;
    _totalWrongAnswer = 0;
  }
}