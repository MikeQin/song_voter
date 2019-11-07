class Song {
  String title;
  int votes = 0;

  Song({this.title, this.votes});

  @override
  String toString() {
    return 'name: ' + title + ', vote: ' + votes.toString();
  }
}
