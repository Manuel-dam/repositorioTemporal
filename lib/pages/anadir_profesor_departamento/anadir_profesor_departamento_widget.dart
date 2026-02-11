import '/backend/schema/structs/index.dart';
import '/components/drag_item_profesor/drag_item_profesor_widget.dart';
import '/components/drag_target_departamento/drag_target_departamento_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anadir_profesor_departamento_model.dart';
export 'anadir_profesor_departamento_model.dart';

/// crea una pantalla que a la izquierda aparezaca una lista de profesores y a
/// la derecha una lista de departamentos
class AnadirProfesorDepartamentoWidget extends StatefulWidget {
  const AnadirProfesorDepartamentoWidget({super.key});

  static String routeName = 'AnadirProfesorDepartamento';
  static String routePath = '/anadirProfesorDepartamento';

  @override
  State<AnadirProfesorDepartamentoWidget> createState() =>
      _AnadirProfesorDepartamentoWidgetState();
}

class _AnadirProfesorDepartamentoWidgetState
    extends State<AnadirProfesorDepartamentoWidget> {
  late AnadirProfesorDepartamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnadirProfesorDepartamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.listaD = await actions.recojerDepartamentoTodo();
      _model.departamentos = _model.listaD!
          .map((e) => DepartamentoStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<DepartamentoStruct>();
      safeSetState(() {});
      _model.listaP = await actions.recojerProfesoresNulos();
      _model.profesores = _model.listaP!
          .map((e) => ProfesorStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<ProfesorStruct>();
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
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profesores',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaProfe = _model.profesores.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaProfe.length,
                            itemBuilder: (context, listaProfeIndex) {
                              final listaProfeItem =
                                  listaProfe[listaProfeIndex];
                              return DragItemProfesorWidget(
                                key: Key(
                                    'Keyzdn_${listaProfeIndex}_of_${listaProfe.length}'),
                                profesor: listaProfeItem,
                              );
                            },
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 16.0)),
                  ),
                ),
              ),
              VerticalDivider(
                width: 1.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).alternate,
              ),
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Departamentos',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.interTight(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                      ),
                      Builder(
                        builder: (context) {
                          final listaDepar = _model.departamentos.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listaDepar.length,
                            itemBuilder: (context, listaDeparIndex) {
                              final listaDeparItem =
                                  listaDepar[listaDeparIndex];
                              return DragTargetDepartamentoWidget(
                                key: Key(
                                    'Key0h2_${listaDeparIndex}_of_${listaDepar.length}'),
                                departamento: listaDeparItem,
                              );
                            },
                          );
                        },
                      ),
                    ]
                        .divide(SizedBox(height: 12.0))
                        .addToStart(SizedBox(height: 16.0)),
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
