class SuccessStory{
  String _videoId;
  String _name;
  String _passion;
  String _quote;

  SuccessStory(this._videoId, this._name, this._passion, this._quote);

  String get quote => _quote;

  set quote(String value) {
    _quote = value;
  }

  String get passion => _passion;

  set passion(String value) {
    _passion = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get videoId => _videoId;

  set videoId(String value) {
    _videoId = value;
  }


}