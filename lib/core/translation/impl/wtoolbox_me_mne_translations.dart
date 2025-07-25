import '../wtoolbox_translations.dart';

class WTMeMneTranslations extends WTTranslations {

  @override
  Map<String, Map<String, String>> get keys => {
    'me_MNE': {
      "key": "${1}",
      "label": "me_MNE",
      "language": "Crnogorski",
      "developedBy": "Vaso Vucinic",
      "languages": '''[
        { 
          "key":      ${1},
          "label":    "me_MNE",
          "language": "Crnogorski",
          "image":    "assets/mne_flag.png",
          "selected": ${true} 
        },
        {
          "key":      ${2},
          "label":    "en_US",
          "language": "Engleski",
          "image":    "assets/great_britain_flag.png", 
          "selected": ${false} 
        }
      ]''',
      "preferredLanguage": "Preferirani jezik",
      "search": "Pretraga...",
      "format": "Format: @value",
      "goBack": "Odustani",
      "continue": "Nastavi",
      "skip": "Preskoči",
      "cancel": "Odustani",
      "select": "Odabrati",
      "save": "Sačuvaj",
      "delete": "Izbriši",
      "edit": "Izmijeni",
      "details": "Detalji",
      "allow": "Dozvoli",
      "apply": "Primjeniti",
      "submit1": "Prihvati",
      "submit2": "Slanje...",
      "next": "Sledeći",
      "add": "Dodati",
      "new": "Novi",
      "title": "Naziv",
      "loading": "Učitavanje...",
      "reviewAll": "Pregledajte sve",
      "viewAll": "Pregledajte sve",
      "emptyField": "Polje ''@value'' je prazno.",
      "routeNotFount": "Ruta nije pronađena.",
      "errorTitle": "Greška",
      "errorsTitle": "Greške",
      "errorMessage": "Nešto nije u redu. Molimo Vas, pokušajte ponovo!",
      "contentMissing": "Sadržaj ove stranice trenutno nije dostupan.",
      "loginOptionPin": "PIN",
      "loginOptionFingerprint": "Otisak prsta",
      "loginOptionFace": "Lice",
      "biometricsMessage": "Molimo potvrdite autentičnost da biste pristupili aplikaciji.",
      "uploadFile": "Dodaj fajlove",
      "chooseFile": "Odaberite fajlove za otpremanje",
      "selectedFiles": "Odabrani fajlovi",
      "moreFormFields": "Prikaži više polja",
      "attachments": "Prilozi",
      "signature": "Potpis",
      "clear": "Obriši",
      "done": "Završeno",
      "confirm": "Potvrdi",
      // websocket errors
      "stompError1": "Nedostaje Auth token.",
      "stompError2": "Auth token nije validan.",
      "stompError3": "Nepoznata Websocket greška.",
      "stompError4": "Greška prilikom uspostavljanja Websocket konekcije.",
      // validation
      "emptyValidator": "Field ''@value'' is empty.",
      "emptySpaceValidator": "''@value'' contains empty space.",
      "emailValidator": "''@value'' is not a valid email.",
      "emailValidator1": "It is possible to enter letters, numbers and characters . + _",
      "phoneValidator": "Phone number can only contain sign + and numbers.",
      "letterValidator": "''@value'' contains letters.",
      "numberValidator": "''@value'' contains numbers.",
      "nonAlphanumericValidator": "''@value'' contains non-alphanumeric characters.",
      "invalidValidator": "''@value'' is invalid.",
      "negativeValidator": "''@value'' must not be negative.",
      "minLengthValidator": "''@key'' must be minimum ''@value'' characters long.",
      "missingValidator": "''@key'' is missing ''@value''"
    },
  };

}