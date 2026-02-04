import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'drag_item_profesor_model.dart';
export 'drag_item_profesor_model.dart';

class DragItemProfesorWidget extends StatefulWidget {
  const DragItemProfesorWidget({
    super.key,
    required this.profesor,
  });

  final ProfesorStruct? profesor;

  @override
  State<DragItemProfesorWidget> createState() => _DragItemProfesorWidgetState();
}

class _DragItemProfesorWidgetState extends State<DragItemProfesorWidget> {
  late DragItemProfesorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DragItemProfesorModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.profo = await actions.recojerProfesorConcreta(
        widget.profesor!.id,
      );
      _model.usuario = UsuarioStruct.maybeFromMap(_model.profo);
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
    return Draggable<String>(
      data: widget.profesor!.id.toString(),
      feedback: Material(
        type: MaterialType.transparency,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          functions.mostrarNombreCompleto(
                              _model.usuario!.nombre,
                              _model.usuario!.apellidos),
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  ),
                ].divide(SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
      ),
      childWhenDragging: DragItemProfesorWidget(
        profesor: widget.profesor!,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        functions.mostrarNombreCompleto(
                            _model.usuario!.nombre, _model.usuario!.apellidos),
                        style: FlutterFlowTheme.of(context).titleSmall.override(
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
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
          ),
        ),
      ),
    );
  }
}
