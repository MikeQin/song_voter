class Song {
  String title;
  int vote = 0;

  Song({this.title, this.vote});

  @override
  String toString() {
    return 'name: ' + title + ', vote: ' + vote.toString();
  }
}
