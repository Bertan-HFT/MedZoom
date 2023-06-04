import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PUFahrdienstSuchenModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController1;
  String? Function(BuildContext, String?)? eingabefeldController1Validator;
  // State field(s) for Eingabefeld widget.
  TextEditingController? eingabefeldController2;
  String? Function(BuildContext, String?)? eingabefeldController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  void dispose() {
    eingabefeldController1?.dispose();
    eingabefeldController2?.dispose();
  }

  /// Additional helper methods are added here.

}
