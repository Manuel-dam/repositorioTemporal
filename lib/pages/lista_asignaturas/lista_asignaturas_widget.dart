import '/backend/schema/structs/index.dart';
import '/components/tarjeta_asignatura/tarjeta_asignatura_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lista_asignaturas_model.dart';
export 'lista_asignaturas_model.dart';

/// crea una pantalla que se muestren las asignaturas, de cada asignatura se
/// mostrara la siguiente informacion, nombre, descripcion, los años que se
/// tarda en acabar, el profesor que la imparte
class ListaAsignaturasWidget extends StatefulWidget {
  const ListaAsignaturasWidget({super.key});

  static String routeName = 'ListaAsignaturas';
  static String routePath = '/listaAsignaturas';

  @override
  State<ListaAsignaturasWidget> createState() => _ListaAsignaturasWidgetState();
}

class _ListaAsignaturasWidgetState extends State<ListaAsignaturasWidget> {
  late ListaAsignaturasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaAsignaturasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.lista = await actions.recojerAsignaturasTodo();
      _model.asignaturas = _model.lista!
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
            'Asignaturas',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final listaLV = _model.asignaturas.toList();

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        16.0,
                        0,
                        16.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listaLV.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
                      itemBuilder: (context, listaLVIndex) {
                        final listaLVItem = listaLV[listaLVIndex];
                        return TarjetaAsignaturaWidget(
                          key: Key(
                              'Keyqxk_${listaLVIndex}_of_${listaLV.length}'),
                          asignatura: listaLVItem,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
