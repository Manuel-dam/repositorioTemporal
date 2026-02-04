import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_admin_model.dart';
export 'menu_admin_model.dart';

/// genera una pantalla que contengan 3 botos cada boton se llamara usurios,
/// carreras y asignaturas
class MenuAdminWidget extends StatefulWidget {
  const MenuAdminWidget({super.key});

  static String routeName = 'MenuAdmin';
  static String routePath = '/menuAdmin';

  @override
  State<MenuAdminWidget> createState() => _MenuAdminWidgetState();
}

class _MenuAdminWidgetState extends State<MenuAdminWidget> {
  late MenuAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuAdminModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            'Sistema Académico',
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Panel de Administración',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                ),
                Text(
                  functions.mostrarNombreCompleto(FFAppState().usuario.nombre,
                      FFAppState().usuario.apellidos),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.bold,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineLarge
                            .fontStyle,
                      ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(ListaUsuariosWidget.routeName);
                  },
                  text: 'Usuarios',
                  icon: Icon(
                    Icons.people_rounded,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: Colors.white,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(ListaAsignaturasWidget.routeName);
                  },
                  text: 'Asignaturas',
                  icon: Icon(
                    Icons.menu_book_rounded,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: Colors.white,
                    color: FlutterFlowTheme.of(context).secondary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(ListaDepartamentoWidget.routeName);
                  },
                  text: 'Departamentos',
                  icon: Icon(
                    Icons.school_rounded,
                    size: 24.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsets.all(8.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconColor: Colors.white,
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.interTight(
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ].divide(SizedBox(height: 24.0)),
            ),
          ),
        ),
      ),
    );
  }
}
