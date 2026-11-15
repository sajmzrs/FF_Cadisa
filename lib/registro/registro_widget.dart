import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/cadisa_input2_widget.dart';
import '/components/toggle_option_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart' hide Type;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'registro_model.dart';
export 'registro_model.dart';

class RegistroWidget extends StatefulWidget {
  const RegistroWidget({super.key});

  static String routeName = 'Registro';
  static String routePath = '/registro';

  @override
  State<RegistroWidget> createState() => _RegistroWidgetState();
}

class _RegistroWidgetState extends State<RegistroWidget> {
  late RegistroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistroModel());
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 16.0),
                  child: Container(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          Text(
                            'Crear cuenta',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.rosario(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                  lineHeight: 1.4,
                                ),
                          ),
                        ].divide(SizedBox(width: 16.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Completá tus datos para solicitar servicios.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.rosario(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.tipo = 'fisica';
                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.toggleOptionModel1,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToggleOptionWidget(
                                        isSelected: !(_model.tipo == 'empresa'),
                                        iconName: Icon(
                                          Icons.add,
                                          color: Colors.transparent,
                                          size: 0.0,
                                        ),
                                        label: 'Persona física',
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.tipo = 'empresa';
                                      safeSetState(() {});
                                    },
                                    child: wrapWithModel(
                                      model: _model.toggleOptionModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: ToggleOptionWidget(
                                        isSelected: _model.tipo == 'empresa',
                                        iconName: Icon(
                                          Icons.add,
                                          color: Colors.transparent,
                                          size: 0.0,
                                        ),
                                        label: 'Empresa',
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 16.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                wrapWithModel(
                                  model: _model.cadisaInputModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CadisaInput2Widget(
                                    hint: 'Nombre completo',
                                    isPassword: false,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.cadisaInputModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CadisaInput2Widget(
                                    hint: 'Cédula',
                                    isPassword: false,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.cadisaInputModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CadisaInput2Widget(
                                    hint: 'Teléfono (+506)',
                                    isPassword: false,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.cadisaInputModel4,
                                  updateCallback: () => safeSetState(() {}),
                                  child: CadisaInput2Widget(
                                    hint: 'Correo electrónico',
                                    isPassword: false,
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    wrapWithModel(
                                      model: _model.cadisaInputModel5,
                                      updateCallback: () => safeSetState(() {}),
                                      child: CadisaInput2Widget(
                                        hint: 'Contraseña',
                                        isPassword: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 0.0, 0.0),
                                      child: Container(
                                        child: Text(
                                          'Mínimo 8 caracteres, una mayúscula y un número',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.rosario(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                                lineHeight: 1.4,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 4.0)),
                                ),
                              ].divide(SizedBox(height: 16.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.termsCheckboxValue ??= false,
                                    onChanged: (newValue) async {
                                      safeSetState(() => _model
                                          .termsCheckboxValue = newValue!);
                                    },
                                    side: (FlutterFlowTheme.of(context)
                                                .secondaryText !=
                                            null)
                                        ? BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText!,
                                          )
                                        : null,
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    checkColor:
                                        FlutterFlowTheme.of(context).info,
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Acepto los términos de uso y la política de privacidad',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.rosario(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 8.0)),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              child: Container(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (((_model.cadisaInputModel1
                                                    .textFieldTextController?.text ??
                                                "")
                                            .trim()
                                            .isEmpty ||
                                        (_model.cadisaInputModel2.textFieldTextController?.text ??
                                                "")
                                            .trim()
                                            .isEmpty ||
                                        (_model.cadisaInputModel3
                                                    .textFieldTextController?.text ??
                                                "")
                                            .trim()
                                            .isEmpty ||
                                        (_model
                                                    .cadisaInputModel4
                                                    .textFieldTextController
                                                    ?.text ??
                                                "")
                                            .trim()
                                            .isEmpty ||
                                        (_model
                                                    .cadisaInputModel5
                                                    .passwordFieldTextController
                                                    ?.text ??
                                                "")
                                            .isEmpty)!) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Completá todos los campos',
                                            style: TextStyle(),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                        ),
                                      );
                                    } else {
                                      if ((!RegExp(r"^\d{8}$").hasMatch((_model
                                                  .cadisaInputModel3
                                                  .textFieldTextController
                                                  ?.text ??
                                              "")
                                          .trim()))!) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'El teléfono debe tener exactamente 8 dígitos',
                                              style: TextStyle(),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                          ),
                                        );
                                      } else {
                                        if ((!RegExp(
                                                r"^[^@\s]+@[^@\s]+\.[^@\s]+$")
                                            .hasMatch((_model
                                                        .cadisaInputModel4
                                                        .textFieldTextController
                                                        ?.text ??
                                                    "")
                                                .trim()))!) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Ingresá un correo electrónico válido',
                                                style: TextStyle(),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                            ),
                                          );
                                        } else {
                                          if ((((_model
                                                              .cadisaInputModel5
                                                              .passwordFieldTextController
                                                              ?.text ??
                                                          "")
                                                      .length <
                                                  8) ||
                                              !RegExp(r"[A-Z]").hasMatch(_model
                                                      .cadisaInputModel5
                                                      .passwordFieldTextController
                                                      ?.text ??
                                                  "") ||
                                              !RegExp(r"[0-9]").hasMatch(_model
                                                      .cadisaInputModel5
                                                      .passwordFieldTextController
                                                      ?.text ??
                                                  ""))!) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'La contraseña debe tener al menos 8 caracteres, una mayúscula y un número',
                                                  style: TextStyle(),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                              ),
                                            );
                                          } else {
                                            if (!_model.termsCheckboxValue!) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Debés aceptar los términos y condiciones',
                                                    style: TextStyle(),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                ),
                                              );
                                            } else {
                                              GoRouter.of(context)
                                                  .prepareAuthEvent();
                                              if ((_model
                                                          .cadisaInputModel5
                                                          .passwordFieldTextController
                                                          ?.text ??
                                                      "")! !=
                                                  (_model
                                                          .cadisaInputModel5
                                                          .passwordFieldTextController
                                                          ?.text ??
                                                      "")!) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Passwords don\'t match!',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }

                                              final user = await authManager
                                                  .createAccountWithEmail(
                                                context,
                                                ((_model
                                                            .cadisaInputModel4
                                                            .textFieldTextController
                                                            ?.text ??
                                                        "")
                                                    .trim())!,
                                                (_model
                                                        .cadisaInputModel5
                                                        .passwordFieldTextController
                                                        ?.text ??
                                                    "")!,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              await currentUserReference!
                                                  .update(createUsersRecordData(
                                                displayName: (_model
                                                            .cadisaInputModel1
                                                            .textFieldTextController
                                                            ?.text ??
                                                        "")
                                                    .trim(),
                                                cedula: (_model
                                                            .cadisaInputModel2
                                                            .textFieldTextController
                                                            ?.text ??
                                                        "")
                                                    .trim(),
                                                phoneNumber: (_model
                                                            .cadisaInputModel3
                                                            .textFieldTextController
                                                            ?.text ??
                                                        "")
                                                    .trim(),
                                                email: (_model
                                                            .cadisaInputModel4
                                                            .textFieldTextController
                                                            ?.text ??
                                                        "")
                                                    .trim(),
                                                tipo: _model.tipo,
                                                rol: 'cliente',
                                              ));

                                              context.pushNamedAuth(
                                                  InicioWidget.routeName,
                                                  context.mounted);
                                            }
                                          }
                                        }
                                      }
                                    }
                                  },
                                  child: Container(
                                    height: 52.0,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: BorderRadius.circular(14.0),
                                      shape: BoxShape.rectangle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      'Registrarme',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.rosario(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                            lineHeight: 1.4,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
