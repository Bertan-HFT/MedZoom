import 'package:http/http.dart' as http;

class TempData {
  static int _mobility = 1;
  static int _responseStatus = -1;
  static String _responseBody = "";
  static const String _ipv4 = '3.64.60.252';
  static const String _ip = 'http://$_ipv4:80';
  static List<String> _data = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ];
  static List<String> _patients = ["-1"];
  static List<String> _drivingServices = ["-1"];
  static List<String> _drivingServicesData = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    ""
  ];

  static int getMobility() {
    return _mobility;
  }

  static setMobility(int value) {
    _mobility = value;
  }

  static String getResponseBody() {
    return _responseBody;
  }

  static setResponseBody(String value) {
    _responseBody = value;
  }

  static int getResponseStatus() {
    return _responseStatus;
  }

  static setResponseStatus(int value) {
    _responseStatus = value;
  }

  static String getIP() {
    return _ip;
  }

  // liest Daten aus der Datenbank
  static Future<void> fetchData(String vorname, String nachname) async {
    try {
      final response = await http.post(
        Uri.parse('$_ip/get_patient_data.php'),
        body: {'vorname': vorname, 'nachname': nachname},
      );

      if (response.body != "-1") {
        _data = response.body.split(';');
      }
    } catch (e) {
      print(e);
    }
  }

  static List<String> getData() {
    return _data;
  }

  // liest Patienten aus der Datenbank
  static Future<void> fetchPatients() async {
    try {
      final response = await http.get(Uri.parse('$_ip/get_patient_list.php'));
      _patients = response.body.split(';');
    } catch (e) {
      print(e);
    }
  }

  static List<String> getPatients() {
    return _patients;
  }

  //
  static Future<void> setData(
      String name,
      String vorname,
      //String geburtsdatum,
      String anschrift,
      int plz,
      String ort,
      String telefonnummer,
      String email,
      String versicherungsnummer,
      int mobilitaetsstufe,
      String mobil,
      int sammelstelle) async {
    try {
      var response = await http.post(
        Uri.parse('$_ip/set_patient_data.php'),
        body: {
          'name': name,
          'vorname': vorname,
          //'geburtsdatum': geburtsdatum,
          'anschrift': anschrift,
          'plz': plz.toString(),
          'ort': ort,
          'telefonnummer': telefonnummer,
          'email': email,
          'versicherungsnummer': versicherungsnummer,
          'mobilitätsstufe': mobilitaetsstufe.toString(),
          'mobil': mobil,
          'sammelstelle': sammelstelle.toString()
        },
      );
      setResponseStatus(response.statusCode);
      setResponseBody(response.body);
    } catch (e) {
      print(e);
    }
  }

  // liest Patienten aus der Datenbank
  static Future<void> fetchDrivingServices() async {
    try {
      final response =
          await http.get(Uri.parse('$_ip/get_driving_services_list.php'));
      _drivingServices = response.body.split(';');
    } catch (e) {
      print(e);
    }
  }

  static List<String> getDrivingServices() {
    return _drivingServices;
  }

  // liest Daten aus der Datenbank
  static Future<void> fetchDrivingServiceData(
      String fahrdienstname, String stadt) async {
    try {
      final response = await http.post(
        Uri.parse('$_ip/get_driving_service_data.php'),
        body: {'fahrdienstname': fahrdienstname, 'stadt': stadt},
      );

      if (response.body != "-1") {
        _drivingServicesData = response.body.split(';');
      }
    } catch (e) {
      print(e);
    }
  }

  static List<String> getDrivingServiceData() {
    return _drivingServicesData;
  }

  static int sammelstelleToID(String value) {
    if (value == "Supermarkt") {
      return 1;
    } else if (value == "Kirche") {
      return 2;
    } else if (value == "Schule") {
      return 3;
    } else {
      return 1;
    }
  }

  //
  static Future<void> setDrivingServiceData(
      //String fahrername,
      String fahrdienstname,
      String stadt,
      String anschrift,
      int plz,
      String ort,
      String telefonnummer,
      String mobilrufnummer,
      String email,
      // int sitzplaetze
      ) async {
    try {
      var response = await http.post(
        Uri.parse('$_ip/set_driving_service_data.php'),
        body: {
          //'fahrername': fahrername,
          'fahrdienstname': fahrdienstname,
          'stadt': stadt,
          'anschrift': anschrift,
          'plz': plz.toString(),
          'ort': ort,
          'telefonnummer': telefonnummer,
          'mobilrufnummer': mobilrufnummer,
          'email': email,
          //'sitzplätze': sitzplaetze.toString(),
        },
      );
      setResponseStatus(response.statusCode);
      setResponseBody(response.body);
    } catch (e) {
      print(e);
    }
  }
}
