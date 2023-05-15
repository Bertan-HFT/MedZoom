import 'package:flutter/material.dart';
import 'colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsSelect.background,
      //AppBar
      appBar: AppBar(
        //Farbverlauf
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
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: const Text(
          "Mein Account",
          style: TextStyle(
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
            Navigator.pop(context);
          },
        ),
      ),
      //Scrollable
      body: SingleChildScrollView(
        //Column mit Row, Listview, und Button
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            //Avatar und Name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Avatar
                  Container(
                    height: 60,
                    width: 60,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                        "assets/images/Persona_Verischerung_Sabine.jpg",
                        fit: BoxFit.cover),
                  ),
                  //Name
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "Sabine Reimers",
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        color: ColorsSelect.textBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Einstellungen, Divider, Dark Mode, Divider, Über die App, Divider, AGB
            ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              children: [
                //Einstellungen Tile
                ListTile(
                  onTap: () {
                    //Navigator.pushNamed(context, '/settings');
                  },
                  tileColor: ColorsSelect.background,
                  title: const Text(
                    "Einstellungen",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: ColorsSelect.textBlack,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  dense: true,
                  contentPadding: const EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: ColorsSelect.tileOverlay,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios,
                      color: ColorsSelect.textBlack, size: 18),
                ),
                //Divider
                const Divider(
                  color: ColorsSelect.tileDivider,
                  height: 16,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                //Switch
                SwitchListTile(
                  value: false,
                  title: const Text(
                    "Ein Switch",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: ColorsSelect.textBlack,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  onChanged: (value) {},
                  tileColor: ColorsSelect.tileColor,
                  activeColor: ColorsSelect.switchActive,
                  activeTrackColor: ColorsSelect.switchActiveTrack,
                  controlAffinity: ListTileControlAffinity.trailing,
                  dense: true,
                  inactiveThumbColor: ColorsSelect.switchInactive,
                  inactiveTrackColor: ColorsSelect.switchInactiveTrack,
                  contentPadding: const EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: ColorsSelect.tileOverlay,
                ),
                //Divider
                const Divider(
                  color: ColorsSelect.tileDivider,
                  height: 16,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                //Über die Software Tile
                const ListTile(
                  tileColor: ColorsSelect.tileColor,
                  title: Text(
                    "Über die Software",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: ColorsSelect.textBlack,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: ColorsSelect.tileOverlay,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: ColorsSelect.textBlack, size: 18),
                ),
                //Divider
                const Divider(
                  color: ColorsSelect.tileDivider,
                  height: 16,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                //AGB Tile
                const ListTile(
                  tileColor: ColorsSelect.tileColor,
                  title: Text(
                    "AGB",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                      color: ColorsSelect.textBlack,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  selected: false,
                  selectedTileColor: ColorsSelect.tileOverlay,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: ColorsSelect.textBlack, size: 18),
                ),
              ],
            ),
            //Buttom zum Ausloggen
            MaterialButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              color: ColorsSelect.buttonAFill,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.all(16),
              textColor: ColorsSelect.buttonAText,
              height: 40,
              minWidth: MediaQuery.of(context).size.width,
              child: const Text(
                "Ausloggen",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
