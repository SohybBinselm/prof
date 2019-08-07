class Scores {
  int _studentId;
  int _monthNum;
  int _sessionNum;
  int _presence;
  int _sheet;
  int _exam;
  int _bonus;

  int get studentId => _studentId;
  int get bonus => _bonus;
  int get exam => _exam;
  int get sheet => _sheet;
  int get presence => _presence;
  int get sessionNum => _sessionNum;
  int get monthNum => _monthNum;


  Scores(this._studentId, this._monthNum, this._sessionNum, this._presence,
      this._sheet, this._exam, this._bonus);

  Scores.map(dynamic obj) {
    this._studentId = obj["studentid"];
    this._monthNum = obj["monthnum"];
    this._sessionNum = obj["sessionnum"];
    this._presence = obj["presence"];
    this._sheet = obj["sheet"];
    this._exam = obj["exam"];
    this._bonus = obj["bonus"];
  }



  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
map["studentid"] =  this._studentId ;
      map["monthnum"] =this._monthNum;
     map["sessionnum"]= this._sessionNum;
    map["presence"]= this._presence ;
     map["sheet"]=this._sheet;
      map["exam"]=this._exam;
     map["bonus"]=this._bonus;

    return map;
  }

  Scores.fromMap(Map<String, dynamic> map) {
    this._studentId = map["studentid"];
    this._monthNum = map["monthnum"];
    this._sessionNum = map["sessionnum"];
    this._presence = map["presence"];
    this._sheet = map["sheet"];
    this._exam = map["exam"];
    this._bonus = map["bonus"];
  }






}