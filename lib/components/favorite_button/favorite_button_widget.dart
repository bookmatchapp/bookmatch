import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'favorite_button_model.dart';
export 'favorite_button_model.dart';

class FavoriteButtonWidget extends StatefulWidget {
  const FavoriteButtonWidget({
    super.key,
    required this.onSelected,
    required this.onUnSelected,
    required this.selected,
  });

  final Future Function()? onSelected;
  final Future Function()? onUnSelected;
  final bool? selected;

  @override
  State<FavoriteButtonWidget> createState() => _FavoriteButtonWidgetState();
}

class _FavoriteButtonWidgetState extends State<FavoriteButtonWidget> {
  late FavoriteButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoriteButtonModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selected = widget.selected!;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Stack(
        children: [
          if (_model.selected)
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: const Icon(
                  Icons.favorite,
                  color: Color(0xFFFF00BE),
                  size: 24.0,
                ),
                onPressed: () async {
                  _model.selected = false;
                  safeSetState(() {});
                  await widget.onUnSelected?.call();
                },
              ),
            ),
          if (!_model.selected)
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 8.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.favorite_border,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  _model.selected = true;
                  safeSetState(() {});
                  await widget.onSelected?.call();
                },
              ),
            ),
        ],
      ),
    );
  }
}
