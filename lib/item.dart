class Item{
  String _image;
  String _title;


  Item(this._image, this._title);

  Item.name(this._image, this._title);

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }


}