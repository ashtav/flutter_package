part of 'helper.dart';

class Config {
  static final font = GoogleFonts.montserrat(fontSize: 16, fontWeight: Fw.normal);

  static const bot = {
    'active': true,
    'token': '1429962773:AAEaQs0zBBSMGwShH1eR2p0O6DgP-Q6uYPg',
    'chatId': '-1001280858842',
  };

  static const debug = true;
  static const baseUrl = 'http://192.168.2.249:8000/api/';

  static const appVersion = '1.0.0+1';
  static const buildNumber = 'Bn 12.3.21.1';
}
