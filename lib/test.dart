

  /*
  //Login Zeugs
  Future<bool> _loginSecure(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_ip/salt.php'),
        body: {'email': email},
      );

      if (response.body == 'Login failed when retrieving salt') {
        if (kDebugMode) {
          print(response.body);
          print('Login failed!');
        }
        return false;
      } else {
        // Salt von Response lesen
        final salt = response.body;
        // Password mit dem Salt hashen
        final hashedPassword =
            sha256.convert(utf8.encode('$salt$password')).toString();
        final loginResponse = await http.post(
          Uri.parse('$_ip/login_secure.php'),
          body: {'email': email, 'password': hashedPassword},
        );

        if (loginResponse.body == 'Login successful') {
          if (kDebugMode) {
            print('Login successful!');
          }
          return true;
        } else {
          if (kDebugMode) {
            print(loginResponse.body);
            print('Login failed!');
          }
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  } */