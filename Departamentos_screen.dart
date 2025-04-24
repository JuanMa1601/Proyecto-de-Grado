import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_button.dart';

class DepartamentosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Restringir la orientación (mejor hacerlo en un StatefulWidget o al iniciar)
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return WillPopScope(
      onWillPop: () async {
        // Restaurar orientaciones al salir
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Seleccionar Departamento'),
          backgroundColor: Colors.white70,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Image.asset(
                'assets/logo_1.png',
                height: MediaQuery.of(context).size.height * 0.30, // Ajuste más conservador
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomButton(
                          text: 'Soldadura',
                          fontSize: 18,
                          onPressed: () {
                            Navigator.pushNamed(context, '/documentos',
                                arguments: {'area':'Soldadura'} // Pasar el área como argumento)
                            );
                          }
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Geología',
                          fontSize: 18,
                          onPressed: () {
                            Navigator.pushNamed(context, '/documentos',
                                arguments: {'area':'Geología'} // Pasar el área como argumento)
                            );
                          }
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Equipo Liviano',
                          fontSize: 18,
                          onPressed: () {
                            Navigator.pushNamed(context, '/documentos',
                                arguments: {'area':'Equipo Liviano'} // Pasar el área como argumento)
                            );
                          }
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                          text: 'Limpieza y Servicios',
                          fontSize: 18,
                          onPressed: () {
                            Navigator.pushNamed(context, '/documentos',
                                arguments: {'area':'Limpieza y Servicios'} // Pasar el área como argumento)
                            );
                          }
                      ),
                    ],
                  ),
                ),
              ),
            ),
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





