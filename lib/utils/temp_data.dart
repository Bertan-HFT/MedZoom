class TempData {
  static int _mobility = 1;
  static const String _ipv4 = '3.75.213.189';
  static const String _ip = 'http://$_ipv4:80';

  static int getMobility() {
    return _mobility;
  }

  static setMobility(int value) {
    _mobility = value;
  }

  static String getIP() {
    return _ip;
  }
}
