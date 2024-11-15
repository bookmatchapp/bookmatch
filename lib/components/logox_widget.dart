import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'logox_model.dart';
export 'logox_model.dart';

class LogoxWidget extends StatefulWidget {
  const LogoxWidget({super.key});

  @override
  State<LogoxWidget> createState() => _LogoxWidgetState();
}

class _LogoxWidgetState extends State<LogoxWidget> {
  late LogoxModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoxModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
          child: FaIcon(
            FontAwesomeIcons.bookReader,
            color: FlutterFlowTheme.of(context).info,
            size: 44.0,
          ),
        ),
        Text(
          'bookmatch',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Inter Tight',
                color: FlutterFlowTheme.of(context).info,
                letterSpacing: 0.0,
              ),
        ),
      ],
    );
  }
}
