class JsonItem {
  int _userId;
  int _id;
  String _title;
  String _body;
  bool _liked;


  JsonItem(this._userId, this._id, this._title, this._body);


  JsonItem.fromJson(Map<String ,dynamic> response){
    this._id=response['id'];
    this._userId =response['userId'];
    this._body =response['body'];
    this._title =response['title'];
  }

  int get userId => _userId;

  int get id => _id;

  bool get liked => _liked;

  String get body => _body;

  String get title => _title;


}
