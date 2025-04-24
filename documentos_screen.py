import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necesario para controlar la orientación
import '../widgets/custom_button.dart'; // Asegúrate de importar el botón personalizado

class DocumentosScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Restringimos la orientación a solo vertical (retrato)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // Obtener los argumentos pasados
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    // Extraer el área de los argumentos
    String area = arguments['area'];

    return WillPopScope(
      onWillPop: () async {
        // Restauramos las orientaciones permitidas al salir de la pantalla
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Documentos de $area'),
          backgroundColor: Colors.white70,
        ),
        body: Column(
          children: [
            // Imagen situada más arriba
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                'assets/logo_1.png', // Asegúrate de cambiar la ruta al logo correcto
                height: MediaQuery.of(context).size.height * 0.30, // Ajuste dinámico del tamaño del logo
                fit: BoxFit.contain,
              ),
            ),
            // Espaciado entre la imagen y los botones
            SizedBox(height: 0),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center, // Centramos el contenido horizontalmente
                    children: <Widget>[
                      CustomButton(
                        text: 'PTS Obligatorios',
                        fontSize: 18,
                        onPressed: () {
                          // Navegar y pasar el área y el tipo de documento
                          Navigator.pushNamed(
                            context,
                            '/verDocumentos',
                            arguments: {'area': area, 'documentType': 'PTS Obligatorios'},
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'MSDS',
                        fontSize: 18,
                        onPressed: () {
                          // Navegar y pasar el área y el tipo de documento
                          Navigator.pushNamed(
                            context,
                            '/verDocumentos',
                            arguments: {'area': area, 'documentType': 'MSDS'},
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'Reglas Para Salvar Vidas',
                        fontSize: 18,
                        onPressed: () {
                          // Navegar y pasar el área y el tipo de documento
                          Navigator.pushNamed(
                            context,
                            '/verDocumentos',
                            arguments: {'area': area, 'documentType': 'Reglas Para Salvar Vidas'},
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        text: 'Intructivos',
                        fontSize: 18,
                        onPressed: () {
                          // Navegar y pasar el área y el tipo de documento
                          Navigator.pushNamed(
                            context,
                            '/verDocumentos',
                            arguments: {'area': area, 'documentType': 'Intructivos'},
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                          text: 'Tareas De Alto Riesgo',
                          fontSize: 18,
                          onPressed: () {
                            // Navegar y pasar el área y el tipo de documento
                            Navigator.pushNamed(
                              context,
                              '/verDocumentos',
                              arguments: {'area': area, 'documentType': 'Tareas De Alto Riesgo'},
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Barra de navegación en la parte inferior
            Container(
              color: Colors.white70.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.image),
                    label: 'Galería',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Documentos',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.phone),
                    label: 'Contacto',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                ],
                onTap: (int index) {
                  // Agregar navegación según índice
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/equipment');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/gallery');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/documents');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/contact');
                      break;
                    case 4:
                      Navigator.pushNamed(context, '/profile');
                      break;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
