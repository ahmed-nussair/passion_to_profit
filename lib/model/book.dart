class Book{
  String _name;
  String _description;
  String _url;
  String _imageUrl;


  Book(this._name, this._description, this._url, this._imageUrl);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get description => _description;

  String get imageUrl => _imageUrl;

  set imageUrl(String value) {
    _imageUrl = value;
  }

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  set description(String value) {
    _description = value;
  }


}