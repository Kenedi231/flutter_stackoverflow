class PostModel {
  List<String> tags;
  Map owner;
  bool is_answered;
  int view_count;
  int answer_count;
  int score;
  DateTime last_activity_date;
  DateTime creation_date;
  int question_id;
  String link;
  String title;

  PostModel(
    this.tags,
    this.owner,
    this.is_answered,
    this.view_count,
    this.answer_count,
    this.score,
    this.last_activity_date,
    this.creation_date,
    this.question_id,
    this.link,
    this.title,
  );
}