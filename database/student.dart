class Student {
  String _name;
  String _phone;
  String _address;
  int _group;
  int _id;

  Student(this._name,this._phone,this._address,this._group);

  Student.map(dynamic obj) {
    this._name = obj["name"];
    this._phone = obj["phone"];
    this._address = obj["address"];
    this._group = obj["groupnum"];
    this._id = obj["id"];
  }

  String get name => _name;
  String get phone => _phone;
  String get address =>_address;
  int get group => _group;
  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = _name;
    map["phone"] = _phone;
    map["address"] = _address;
    map["groupnum"] = _group;

    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }

  Student.fromMap(Map<String, dynamic> map) {
    this._name = map["name"];
    this._phone = map["phone"];
    this._address = map["address"];
    this._group = map["groupnum"];
    this._id = map["id"];
  }






}