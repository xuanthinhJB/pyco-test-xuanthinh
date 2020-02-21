library user;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pyco_test_tony/model/location.dart';
import 'package:pyco_test_tony/model/name.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder> {		
  
  @nullable
  String get gender;

  @nullable
  String get email;
  
  @nullable
  Name get name;

  @nullable
  Location get location;

  @nullable
  String get username;
  
  @nullable
  String get password;

  @nullable
  String get salt;

  @nullable
  String get md5;
  
  @nullable
  String get sha1;
  
  @nullable
  String get sha256;

  @nullable
  String get registered;

  @nullable
  String get dob;
  
  @nullable
  String get phone;
  
  @nullable
  String get cell;

  @nullable
  @BuiltValueField(wireName: 'SSN')
  String get ssn;

  @nullable
  String get picture;

  @nullable
  String get localImage;
  
  User._();

  factory User([updates(UserBuilder builder)]) = _$User;

  static Serializer<User> get serializer => _$userSerializer;

  static List<User> fromDBArray(List<Map<String, dynamic>> jsonArr) {
    return jsonArr.map((map) => User.fromDB(map)).toList();
  }

  factory User.fromDB(Map<String, dynamic> map) {
    print(map.toString());
    User user = User();
    Name name = Name();
    Location location = Location();
    name = name.rebuild((b) => b
      ..title = map['Title']
      ..first = map['First']
      ..last = map['Last']);
    location = location.rebuild((b) => b
      ..city = map['City']
      ..state = map['State']
      ..street = map['Street']
      ..zip = map['Zi[']);
    user = user.rebuild((b) => b
      ..cell = map['Cell']
      ..dob = map['Dob']
      ..email = map['Email']
      ..gender = map['Gender']
      ..location = location.toBuilder()
      ..name = name.toBuilder()
      ..md5 = map['Md5']
      ..password = map['Password']
      ..phone = map['Phone']
      ..picture = map['Picture']
      ..registered = map['Registered']
      ..salt = map['Salt']
      ..sha1 = map['Sha1']
      ..sha256 = map['Sha256']
      ..ssn = map['Ssn']
      ..username = map['Username']
      ..localImage = map['Base64']);
    return user;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['Gender'] = this.gender;
    map['Email'] = this.email;
    map['Title'] = this.name.title;
    map['First'] = this.name.first;
    map['Last'] = this.name.last;
    map['Street'] = this.location.street;
    map['City'] = this.location.city;
    map['State'] = this.location.state;
    map['Zip'] = this.location.zip;
    map['Username'] = this.username;
    map['Password'] = this.password;
    map['Salt'] = this.salt;
    map['Md5'] = this.md5;
    map['Sha1'] = this.sha1;
    map['Sha256'] = this.sha256;
    map['Registered'] = this.registered;
    map['Dob'] = this.dob;
    map['Phone'] = this.phone;
    map['Cell'] = this.cell;
    map['Ssn'] = this.ssn;
    map['Picture'] = this.picture;
    map['Base64'] = this.localImage;

    return map;
  }
}