class TempData {
  static int _mobility = 1;
  static const String _ip = 'http://35.157.131.198:80';

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
