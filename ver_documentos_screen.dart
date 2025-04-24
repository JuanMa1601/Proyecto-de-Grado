import 'package:flutter/material.dart';
import 'areas/soldadura/pts_obligatorios/clase_pts_obligatorios_soldadura.dart';



class VerDocumentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Recibe los argumentos
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String area = args['area'];
    String documentType = args['documentType'];

    // Decide qué mostrar según los argumentos
    if (documentType == 'PTS Obligatorios' && area == 'Soldadura') {
      return ClasePtsObligatoriosSoldadura(); // Retorna tu clase correspondiente
    }

    // Agrega más condiciones aquí si es necesario

    // Pantalla de error si no coincide con ninguna condición
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('No se encontró el documento.'),
      ),
    );
  }
}


