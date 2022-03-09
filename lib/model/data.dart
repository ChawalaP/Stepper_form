class Data{
  String _name;
  int _age ;
  int _weight;
  int _height;
  String _blood_type;
  String _houseNo ;
  String _subDistrict;
  String _district;
  String _province;
  String _postal_code;

  Data(
      this._name,
      this._age,
      this._weight,
      this._height,
      this._blood_type,
      this._houseNo,
      this._subDistrict,
      this._district,
      this._province,
      this._postal_code);

  String get postal_code => _postal_code;

  String get province => _province;

  String get district => _district;

  String get subDistrict => _subDistrict;

  String get houseNo => _houseNo;

  String get blood_type => _blood_type;

  int get height => _height;

  int get weight => _weight;

  int get age => _age;

  String get name => _name;
}