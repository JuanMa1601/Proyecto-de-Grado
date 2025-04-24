# Nemesis - Visualizador de Documentos Industriales

Nemesis es una aplicación móvil desarrollada con Flutter, diseñada para facilitar el acceso organizado y rápido a documentos industriales como PTS, MSDS, reglas de seguridad y más. Esta app está especialmente enfocada en entornos operativos como el sector minero e industrial.

## Características

- Navegación por áreas: Soldadura, Geología, Equipo Liviano, Limpieza y Servicios.
- Visualización de distintos tipos de documentos:
  - PTS Obligatorios
  - MSDS
  - Reglas para salvar vidas
  - Instructivos
  - Tareas de alto riesgo
- Visor de documentos PDF integrado
- Restricción de orientación vertical para una experiencia controlada
- Componentes reutilizables personalizados (botones, barra de navegación)
- Compatible con Android e iOS

## Estructura del Proyecto

```
lib/
├── main.dart
├── screens/
│   ├── Departamentos_screen.dart
│   ├── documentos_screen.dart
│   ├── ver_documentos_screen.dart
│   └── pdf_viewer_page_screen.dart
├── widgets/
│   ├── custom_button.dart
│   ├── center_button.dart
│   └── CustomBottomNavBar.dart
assets/
└── logo_1.png
    └── Documentos/
        └── PTS_Obligatorios/...
```

## Instalación y Ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tuusuario/nemesis-app.git
   cd nemesis-app
   ```

2. Instala las dependencias:
   ```bash
   flutter pub get
   ```

3. Corre la aplicación:
   ```bash
   flutter run
   ```

> Asegúrate de tener Flutter y Dart configurados correctamente en tu entorno. Puedes verificarlo con `flutter doctor`.

## Recursos

- Flutter SDK
- [flutter_pdfview](https://pub.dev/packages/flutter_pdfview)
- [path_provider](https://pub.dev/packages/path_provider)


##  Autor

Juan Meriño Mercado 
Estudiante de Ingeniería de Sistemas - UNAD 2024
