import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drag_target_departamento_model.dart';
export 'drag_target_departamento_model.dart';

class DragTargetDepartamentoWidget extends StatefulWidget {
  const DragTargetDepartamentoWidget({
    super.key,
    required this.departamento,
  });

  final DepartamentoStruct? departamento;

  @override
  State<DragTargetDepartamentoWidget> createState() =>
      _DragTargetDepartamentoWidgetState();
}

class _DragTargetDepartamentoWidgetState
    extends State<DragTargetDepartamentoWidget> {
  late DragTargetDepartamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragTargetDepartamentoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onAcceptWithDetails: (details) async {
        _model.color = FlutterFlowTheme.of(context).accent4;
        safeSetState(() {});
        if (details.data != '') {
          await actions.actualizarProfesorDepartamento(
            details.data,
            widget.departamento!.id.toString(),
          );
        }

        safeSetState(() {});
      },
      onWillAcceptWithDetails: (details) {
        (() async {
          _model.color = FlutterFlowTheme.of(context).accent2;
          safeSetState(() {});

          safeSetState(() {});
        })();
        return true;
      },
      onLeave: (data) async {
        _model.color = FlutterFlowTheme.of(context).accent4;
        safeSetState(() {});

        safeSetState(() {});
      },
      builder: (context, _, __) {
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _model.color,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x1A000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.departamento?.name,
                                  'nombre',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
