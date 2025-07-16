import 'package:resumebuilderadmin/core/clean_architecture/entity/wtoolbox_entity.dart';

class Account extends WTEntity<Account> {

  Account({
    super.key,
    super.date,
    this.language,
    this.theme,
    this.isLoggedIn,
    this.isAdmin,
    this.token,
    this.firstname,
    this.lastname,
    this.email,
    this.avatar,
    this.dateOfBirth,
    this.city,
    this.country,
    this.gender,
  });

  String? language; // label for selected language
  void setLanguage(String? v) { language = v; }

  String? theme; // name of selected theme
  void setTheme(String? v) { theme = v; }

  bool? isLoggedIn; // check if account is logged in
  void setIsLoggedIn(bool? v) { isLoggedIn = v; }

  bool? isAdmin; // is account admin
  void setIsAdmin(bool? v) { isAdmin = v; }

  Map<String, dynamic>? token = <String, dynamic>{}; // jwt token
  void setToken(Map<String, dynamic>? v) { token = v; }

  String? firstname;
  void setFirstname(String? v) { firstname = v; }

  String? lastname;
  void setLastname(String? v) { lastname = v; }

  String? email;
  void setEmail(String? v) { email = v; }

  String? avatar;
  void setAvatar(String? v) { avatar = v; }

  String? dateOfBirth;
  void setDateOfBirth(String? v) { dateOfBirth = v; }

  String? city;
  void setCity(String? v) { city = v; }

  String? country;
  void setCountry(String? v) { country = v; }

  String? gender;
  void setGender(String? v) { gender = v; }
  
  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':         key,
      'date':        date,
      'language':    language,
      'theme':       theme,
      'isLoggedIn':  isLoggedIn,
      'isAdmin':     isAdmin,
      'token':       token,
      'firstname':   firstname,
      'lastname':    lastname,
      'email':       email,
      'avatar':      avatar,
      'dateOfBirth': dateOfBirth,
      'city':        city,
      'country':     country,
      'gender':      gender,
    };
  }

  @override
  Account? fromJson(Map? json) {
    return Account(
      key:         json!['key'],
      date:        json['date'],
      language:    json['language'],
      theme:       json['theme'],
      isLoggedIn:  json['isLoggedIn'],
      isAdmin:     json['isAdmin'],
      token:       json['token'],
      firstname:   json['firstname'],
      lastname:    json['lastname'],
      email:       json['email'],
      avatar:      json['avatar'],
      dateOfBirth: json['dateOfBirth'],
      city:        json['city'],
      country:     json['country'],
      gender:      json['gender'],
    );
  }

  @override
  Account? empty() {
    return Account(
      key:         0,
      date:        '',
      language:    '',
      theme:       '',
      isLoggedIn:  false,
      isAdmin:     false,
      token:       {},
      firstname:   '',
      lastname:    '',
      email:       '',
      avatar:      '',
      dateOfBirth: '',
      city:        '',
      country:     '',
      gender:      '',
    );
  }
  
}