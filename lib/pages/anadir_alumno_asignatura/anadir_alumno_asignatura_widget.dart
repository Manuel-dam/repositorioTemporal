import '/backend/schema/structs/index.dart';
import '/components/drag_item_alumno/drag_item_alumno_widget.dart';
import '/components/drag_target_asignatura/drag_target_asignatura_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anadir_alumno_asignatura_model.dart';
export 'anadir_alumno_asignatura_model.dart';

/// crea una pantalla que a la izquierda aparezaca una lista de alumnos y a la
/// derecha una lista de asignaturas
class AnadirAlumnoAsignaturaWidget extends StatefulWidget {
  const AnadirAlumnoAsignaturaWidget({super.key});

  static String routeName = 'AnadirAlumnoAsignatura';
  static String routePath = '/anadirAlumnoAsignatura';

  @override
  State<AnadirAlumnoAsignaturaWidget> createState() =>
      _AnadirAlumnoAsignaturaWidgetState();
}

class _AnadirAlumnoAsignaturaWidgetState
    extends State<AnadirAlumnoAsignaturaWidget> {
  late AnadirAlumnoAsignaturaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnadirAlumnoAsignaturaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.alumnos = await actions.recojerAlumnosTodos();
      _model.listaAlumnos = _model.alumnos!
          .map((e) => AlumnoStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<AlumnoStruct>();
      safeSetState(() {});
      _model.asignaturas = await actions.recojerAsignaturasTodos();
      _model.listaAsignaturas = _model.asignaturas!
          .map((e) => AsignaturaStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<AsignaturaStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Gestión Académica',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 40.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.search_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alumnos',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaAl = _model.listaAlumnos.toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaAl.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listaAlIndex) {
                              final listaAlItem = listaAl[listaAlIndex];
                              return DragItemAlumnoWidget(
                                key: Key(
                                    'Key7xw_${listaAlIndex}_of_${listaAl.length}'),
                                profesor: listaAlItem,
                              );
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
              SizedBox(
                width: 1.0,
                child: Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Asignaturas',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaAs = _model.listaAsignaturas.toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaAs.length,
                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                            itemBuilder: (context, listaAsIndex) {
                              final listaAsItem = listaAs[listaAsIndex];
                              return DragTargetAsignaturaWidget(
                                key: Key(
                                    'Key2j9_${listaAsIndex}_of_${listaAs.length}'),
                                asignatura: listaAsItem,
                              );
                            },
                          );
                        },
                      ),
                    ].divide(SizedBox(height: 16.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
