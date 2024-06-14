class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    //copiing the list to change the list by shuffling and return the new list
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
