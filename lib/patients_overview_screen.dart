import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:medzoom/temp_data.dart';
import 'colors.dart';

class PatientsOverviewScreen extends StatefulWidget {
  const PatientsOverviewScreen({super.key});

  @override
  State<PatientsOverviewScreen> createState() => _PatientsOverviewScreenState();
}

class _PatientsOverviewScreenState extends State<PatientsOverviewScreen> {
  final String _ip = TempData.getIP();
  final String _name = "Hofer";
  final String _vorname = "Hildegard";
  int _mobility = TempData.getMobility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        //Farbverlauf Hintergrund
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: <Color>[
                  ColorsSelect.medZoomA,
                  ColorsSelect.medZoomB,
                ]),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Daten von $_vorname $_name",
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: ColorsSelect.appbarTitle,
          ),
        ),
        //Zurück Button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: ColorsSelect.textWhite, size: 24),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/patients');
          },
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(16),
        shrinkWrap: false,
        physics: const ScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 200,
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.zero,
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              shrinkWrap: false,
              physics: const ScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "Mobilitätsstufe:",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 16,
                        width: 32,
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: DropdownButton(
                        value: _mobility,
                        items: [1, 2, 3, 4, 5]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        style: const TextStyle(
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                        ),
                        onChanged: (value) {
                          setState(() {
                            _mobility = value!;
                          });
                        },
                        elevation: 8,
                        isExpanded: true,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xff808080),
                  height: 16,
                  thickness: 0,
                  indent: 0,
                  endIndent: 0,
                ),
                MaterialButton(
                  onPressed: () async {
                    var response = await http.post(
                      Uri.parse('$_ip/set_mobility.php'),
                      body: {
                        'name': _name,
                        'first_name': _vorname,
                        'mobility': _mobility.toString()
                      },
                    );
                    if (response.statusCode == 200 && context.mounted) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(response.body),
                            content: Text(
                                "Mobilitätsstufe von $_vorname $_name auf $_mobility gesetzt."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Request Failed"),
                            content: Text(
                                "The HTTP request failed with status code ${response.statusCode}."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  color: const Color(0xffffffff),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: const BorderSide(color: Color(0xff808080), width: 1),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  textColor: const Color(0xff000000),
                  height: 40,
                  minWidth: 140,
                  child: const Text(
                    "Mobilität aktualisieren",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
