# Reglas de Firestore

La copia de referencia es `firestore.rules`. Al sincronizar una exportación de
FlutterFlow, conserva este archivo: las reglas generadas por FlutterFlow no
incluyen las validaciones de roles y campos de esta versión.

El registro crea un perfil para el UID autenticado con el rol de cliente por
defecto. El dueño puede actualizar sus datos de perfil. El rol de administrador
se asigna fuera de la app con acceso administrativo a Firebase. Los
administradores pueden consultar perfiles. La app no puede eliminar perfiles.

Para verificar las reglas en un emulador local con Node.js y Java:

```sh
cd firebase/tests
npm ci
npm test
```

Las pruebas usan el proyecto local `demo-cadisa-reglas`. Para publicar las
reglas, ejecuta desde `firebase/` con Firebase CLI autorizado:

```sh
firebase deploy --only firestore:rules --project cadisa-f0rzvq
```
