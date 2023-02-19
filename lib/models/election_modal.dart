class ElectionModal {
  final int id;
  final String election_title;
  final String start_at;
  final String end_at;
  final bool voted;
  bool isPast;

  ElectionModal(
      this.id, this.election_title, this.start_at, this.end_at, this.voted,
      {this.isPast = false});
}
