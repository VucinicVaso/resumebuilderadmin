import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/entity/wt_entity.dart';
import 'package:resumebuilderadmin/domain/entity/account/account.dart';

class AccountMapper {

  static Account toEntity(AccountModel model) {
    return Account(
      key:         model.key,
      date:        model.date,
      language:    model.language,
      theme:       model.theme,
      isLoggedIn:  model.isLoggedIn,
      isAdmin:     model.isAdmin,
      token:       model.token,
      firstname:   model.firstname,
      lastname:    model.lastname,
      email:       model.email,
      image:       model.image,
      dateOfBirth: model.dateOfBirth,
      city:        model.city,
      country:     model.country,
    );
  }

  static AccountModel toModel(Account entity) {
    return AccountModel(
      key:         entity.key,
      date:        entity.date,
      language:    entity.language,
      theme:       entity.theme,
      isLoggedIn:  entity.isLoggedIn,
      isAdmin:     entity.isAdmin,
      token:       entity.token,
      firstname:   entity.firstname,
      lastname:    entity.lastname,
      email:       entity.email,
      image:       entity.image,
      dateOfBirth: entity.dateOfBirth,
      city:        entity.city,
      country:     entity.country,
    );
  }

}

class AccountModel extends WTEntity<AccountModel> {

  AccountModel({
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
  AccountModel? fromJson(Map? json) {
    return AccountModel(
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
  AccountModel? empty() {
    return AccountModel(
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
      image:       '',
      dateOfBirth: '',
      city:        '',
      country:     '',
    );
  }
 
}