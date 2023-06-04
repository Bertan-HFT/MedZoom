import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/p_u_fahrdienst_suchen/p_u_fahrdienst_suchen_widget.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FahrdienstModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController1;
  String? Function(BuildContext, String?)? eingabefeldController1Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController2;
  String? Function(BuildContext, String?)? eingabefeldController2Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController3;
  String? Function(BuildContext, String?)? eingabefeldController3Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController4;
  String? Function(BuildContext, String?)? eingabefeldController4Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController5;
  String? Function(BuildContext, String?)? eingabefeldController5Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController6;
  String? Function(BuildContext, String?)? eingabefeldController6Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController7;
  String? Function(BuildContext, String?)? eingabefeldController7Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController8;
  String? Function(BuildContext, String?)? eingabefeldController8Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    eingabefeldController1?.dispose();
    eingabefeldController2?.dispose();
    eingabefeldController3?.dispose();
    eingabefeldController4?.dispose();
    eingabefeldController5?.dispose();
    eingabefeldController6?.dispose();
    eingabefeldController7?.dispose();
    eingabefeldController8?.dispose();
  }

  /// Additional helper methods are added here.

}
