import 'package:flutter/material.dart';
import 'screens/ver_documentos_screen.dart';
import 'screens/documentos_screen.dart';
import 'screens/Departamentos_screen.dart';
import 'screens/pdf_viewer_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Restringir la aplicación solo a modo vertical.
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      title: 'Mi Aplicación',
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de depuración
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        // Ruta para la pantalla de bienvenida
        '/': (context) => DepartamentosScreen(),
        // Pantalla de equipos
        '/departamentos': (context) => DepartamentosScreen(),
        '/documentos': (context) => DocumentosScreen(),
        '/verDocumentos': (context) => VerDocumentosScreen(),
        // Rutas para visualizar documentos PDF
        '/pdf1': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-001 FABRICACIÓN  Y REPARACIÓN  DE COMPONENTES EN TALLER.pdf',
        ),
        '/pdf2': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-002 FABRICACIÓN REPARACIÓN Y CAMBIO DE COMPONENTES EN LA DRAGALINA.pdf',
        ),
        '/pdf3': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-003 REPARACIÓN DE COMPONENTES EN CAMPO DE PALAS HIDRAÚLICAS Y PALAS DE CABLES.pdf',
        ),
        '/pdf4': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-004 REPARACIÓN DE APRON FEEDER, E-HOUSE Y CAJAS FEEDER.pdf',
        ),
        '/pdf5': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-005 FABRICACIÓN, REPARACIÓN Y MANTENIMIENTO DE COMPONENTES EN LOAD OUT.pdf',
        ),
        '/pdf6': (context) => PdfViewerPage(
          pdfPath: 'assets/Documentos/PTS_Obligatorios/PTS_Soldadura/SG-PTS-MSO-006 REPARACIÓN DE COMPONENTES EN EQUIPO MÓVIL.pdf',
        ),
      },
      // Configuración para evitar que la aplicación gire a modo horizontal
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            size: MediaQuery.of(context).size,
            platformBrightness: MediaQuery.of(context).platformBrightness, textScaler: TextScaler.linear(MediaQuery.of(context).textScaleFactor),
          ),
          child: child ?? SizedBox.shrink(),
        );
      },
    );
  }
}


