class ElectionCandidateModel {
  final int id;
  final String full_name;
  final String title;
  final String logo;
  // final int total_votes;
  final int accepted_votes;
  final int rejected_votes;

  ElectionCandidateModel(this.id, this.full_name, this.title, this.logo,
      { this.accepted_votes = 0, this.rejected_votes = 0});
}
