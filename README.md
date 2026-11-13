# CADISA Móvil

Aplicación móvil para solicitar y gestionar servicios de limpieza de Grupo
Empresarial CADISA, S.A. Tiene dos roles: cliente y administrador.

Proyecto del curso SC-703 Programación para Dispositivos Móviles.

## Equipo

- Sebastián Jiménez
- Nataly Camareno

## Tecnologías

- FlutterFlow (diseño y generación del código Flutter)
- Flutter y Dart
- Firebase: Authentication, Cloud Firestore y Storage

## Funcionalidades principales

- Registro, inicio de sesión y recuperación de contraseña.
- Catálogo de servicios y detalle de cada servicio.
- Solicitud de cotización y agenda de fecha y franja.
- Seguimiento del estado de las solicitudes.
- Gestión de direcciones, notificaciones y calificación del servicio.
- Panel del administrador para cotizar, asignar cuadrillas y gestionar el catálogo.

## Estructura

```
lib/
  auth/          Autenticación con Firebase
  backend/       Acceso a Firestore y Storage
  components/    Componentes reutilizables
  flutter_flow/  Utilidades generadas por FlutterFlow
  <pantalla>/    Una carpeta por pantalla de la app
assets/          Imágenes, íconos y fuentes
firebase/        Reglas e índices de Firebase
```

## Cómo ejecutar

Requiere Flutter en el canal `stable`.

```bash
flutter pub get
flutter run
```

## Ramas

- `flutterflow`: la actualiza FlutterFlow con cada push. No se trabaja directo ahí.
- `main`: rama principal. Los cambios entran por Pull Request.
- `feature/hu-XX-descripcion`: una rama por historia de usuario.
