class SkillTester{
  String? _questionText;
  bool? _answer;

  SkillTester(this._questionText, this._answer);

  bool? get answer => _answer;

  String? get questionText => _questionText;
}