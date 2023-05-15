import 'package:flutter/material.dart';
import 'package:medzoom/temp_data.dart';
import 'account_screen.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String ip = TempData.getIP();
    return Scaffold(
      backgroundColor: const Color(0xffebebeb),
      appBar: AppBar(
        //Farbverlauf Hintergrund
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.centerLeft,
              colors: <Color>[
                ColorsSelect.medZoomA,
                ColorsSelect.medZoomB,
              ],
            ),
          ),
        ),
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffffffff),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Patienten",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 18,
            color: Color(0xffffffff),
          ),
        ),
        //Zurück Button
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings,
                color: ColorsSelect.appbarTitle, size: 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (const AccountScreen())),
              );
            },
          )
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () async {
              final response = await http.post(
                Uri.parse('$ip/get_mobility.php'),
                body: {'name': 'Hofer', 'first_name': 'Hildegard'},
              );
              if (context.mounted && response.statusCode == 200) {
                print(response.body);
                TempData.setMobility(int.parse(response.body));
                Navigator.pushNamed(context, '/overview');
              }
            },
            child: Card(
              margin: const EdgeInsets.all(0),
              color: const Color(0xffffffff),
              shadowColor: const Color(0xff000000),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0)),
                    child: Image(
                      image: AssetImage(
                          "assets/images/Persona_Patient_Hildegard.jpg"),
                      height: 130,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Hildegard Hofer",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "A123456789",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff7a7a7a),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              " AOK Ba-Wü",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "Irgendwas",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 11,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/overview');
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              color: const Color(0xffffffff),
              shadowColor: const Color(0xff000000),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0)),
                    child: Image(
                      image: AssetImage(
                          "assets/images/Persona_Patient_Thorsten.jpg"),
                      height: 130,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Thorsten Stuber",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "A113000000",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff7a7a7a),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Bahn-BKK",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "Etwas anderes",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 11,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/overview');
            },
            child: Card(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              color: const Color(0xffffffff),
              shadowColor: const Color(0xff000000),
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        bottomLeft: Radius.circular(12.0)),
                    child: Image(
                      image: AssetImage(
                          "assets/images/Persona_Patient_Brigitta.jpg"),
                      height: 130,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Text(
                            "Brigitta Gottlieb",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              fontSize: 16,
                              color: Color(0xff000000),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "Z987654321",
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 12,
                                color: Color(0xff7a7a7a),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 4, 0, 0),
                            child: Text(
                              "LKK",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: 18,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: Text(
                              "Alles andere",
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: 11,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
