import 'package:wtoolboxweb/base/entity/wtw_entity.dart';

class Account extends WTWEntity<Account> {

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
    this.image,
    this.dateOfBirth,
    this.city,
    this.country,
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

  String? image;
  void setImage(String? v) { image = v; }

  String? dateOfBirth;
  void setDateOfBirth(String? v) { dateOfBirth = v; }

  String? city;
  void setCity(String? v) { city = v; }

  String? country;
  void setCountry(String? v) { country = v; }

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
      'image':       image,
      'dateOfBirth': dateOfBirth,
      'city':        city,
      'country':     country,
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
      image:       json['image'],
      dateOfBirth: json['dateOfBirth'],
      city:        json['city'],
      country:     json['country'],
    );
  }

  @override
  Account? empty() {
    return Account(
      key:         0,
      date:        '',
      language:    'me_MNE',
      theme:       'light',
      isLoggedIn:  false,
      isAdmin:     false,
      token:       {},
      firstname:   '',
      lastname:    '',
      email:       '',
      image:       '',
      dateOfBirth: '',
      city:        '',
      country:     '',
    );
  }
  
}