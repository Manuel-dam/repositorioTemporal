import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'asignatura_detalle_model.dart';
export 'asignatura_detalle_model.dart';

/// crea una pantalla que aparecera el nombre de la asignatura, una
/// descripcion, los creditos y el año, en la parte inferior tendra 2 botones,
/// Gráfico y PDF, y tendra un espacio reservado para mostrar una grafica o un
/// pdf
class AsignaturaDetalleWidget extends StatefulWidget {
  const AsignaturaDetalleWidget({
    super.key,
    required this.asignatura,
  });

  final AsignaturaStruct? asignatura;

  static String routeName = 'AsignaturaDetalle';
  static String routePath = '/asignaturaDetalle';

  @override
  State<AsignaturaDetalleWidget> createState() =>
      _AsignaturaDetalleWidgetState();
}

class _AsignaturaDetalleWidgetState extends State<AsignaturaDetalleWidget> {
  late AsignaturaDetalleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsignaturaDetalleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.matriculasJ = await actions.recojerMatricucaConcreta(
        widget.asignatura!.id.toString(),
      );
      _model.listaMatriculas = _model.matriculasJ!
          .map((e) => MatriculaStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<MatriculaStruct>();
      safeSetState(() {});
      _model.alumnosJ = await actions.recojerAlumnosUsuarios();
      _model.listaAlumnos = _model.alumnosJ!
          .map((e) => UsuarioStruct.maybeFromMap(e))
          .withoutNulls
          .toList()
          .toList()
          .cast<UsuarioStruct>();
      safeSetState(() {});
      _model.listaNombres = functions
          .buscarNombresAlumnos(
              _model.listaAlumnos.toList(), _model.listaMatriculas.toList())
          .toList()
          .cast<String>();
      _model.listaNotas = functions
          .buscarNotaConcreta(_model.listaMatriculas.toList())
          .toList()
          .cast<double>();
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
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: FlutterFlowIconButton(
              borderRadius: 12.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              icon: Icon(
                Icons.arrow_back_ios,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Detalles de Asignatura',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.interTight(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8.0,
                        color: Color(0x1A000000),
                        offset: Offset(
                          0.0,
                          4.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.asignatura?.nombre,
                            'nombre',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            widget.asignatura?.descripcion,
                            'descripcion',
                          ),
                          maxLines: 3,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                                lineHeight: 1.4,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Créditos',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .fontStyle,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    widget.asignatura?.creditos.toString(),
                                    '0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ].divide(SizedBox(height: 12.0)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 400.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          color: Color(0x1A000000),
                          offset: Offset(
                            0.0,
                            4.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Stack(
                      children: [
                        if (_model.eleccion == 1)
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Container(
                              width: 370.0,
                              height: 230.0,
                              child: FlutterFlowBarChart(
                                barData: [
                                  FFBarChartData(
                                    yData: _model.listaNotas,
                                    color: FlutterFlowTheme.of(context).primary,
                                  )
                                ],
                                xLabels: _model.listaNombres,
                                barWidth: 16.0,
                                barBorderRadius: BorderRadius.circular(8.0),
                                groupSpace: 8.0,
                                alignment: BarChartAlignment.spaceAround,
                                chartStylingInfo: ChartStylingInfo(
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  showGrid: true,
                                  borderColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderWidth: 1.0,
                                ),
                                axisBounds: AxisBounds(),
                                xAxisLabelInfo: AxisLabelInfo(
                                  title: 'Nombres',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelInterval: 10.0,
                                  reservedSize: 28.0,
                                ),
                                yAxisLabelInfo: AxisLabelInfo(
                                  title: 'Notas',
                                  titleTextStyle: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                  showLabels: true,
                                  labelInterval: 10.0,
                                  reservedSize: 42.0,
                                ),
                              ),
                            ),
                          ),
                        if (_model.eleccion == 2)
                          FlutterFlowPdfViewer(
                            fileBytes: _model.pdfs?.bytes,
                            width: double.infinity,
                            height: double.infinity,
                            horizontalScroll: true,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.eleccion = 1;
                          safeSetState(() {});
                        },
                        text: 'Gráfico',
                        icon: Icon(
                          Icons.bar_chart,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: Colors.white,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 2.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 16.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.pdfs = await actions.generarPDF(
                            _model.listaNombres.toList(),
                            _model.listaNotas.toList(),
                          );
                          {
                            safeSetState(() =>
                                _model.isDataUploading_uploadDataMl3 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedFiles = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              selectedUploadedFiles =
                                  _model.pdfs!.bytes!.isNotEmpty
                                      ? [_model.pdfs!]
                                      : <FFUploadedFile>[];
                              selectedFiles = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                                storageFolderPath: 'pdfs/informes',
                              );
                              downloadUrls = await uploadSupabaseStorageFiles(
                                bucketName: 'pdfs',
                                selectedFiles: selectedFiles,
                              );
                            } finally {
                              _model.isDataUploading_uploadDataMl3 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedFiles.length &&
                                downloadUrls.length == selectedFiles.length) {
                              safeSetState(() {
                                _model.uploadedLocalFile_uploadDataMl3 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl_uploadDataMl3 =
                                    downloadUrls.first;
                              });
                            } else {
                              safeSetState(() {});
                              return;
                            }
                          }

                          _model.eleccion = 2;
                          safeSetState(() {});

                          safeSetState(() {});
                        },
                        text: 'PDF',
                        icon: Icon(
                          Icons.picture_as_pdf,
                          size: 20.0,
                        ),
                        options: FFButtonOptions(
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconColor: FlutterFlowTheme.of(context).primary,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
