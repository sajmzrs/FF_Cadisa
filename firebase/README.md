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

## Catálogo, solicitud y Agenda

- `servicios`: el catálogo consulta con `activo == true`. Envía la referencia del documento al detalle y al formulario.
- Formulario → Agenda: el formulario reemplaza `FFAppState().borradorAgenda` con `servicioRef`, `tipoInmueble` (`Residencial`, `Comercial` o `Industrial`), `areaCantidad`, `direccion`, `detalles` y hasta cinco rutas de fotos. El estado se guarda en memoria para que esos datos no aparezcan en la URL. Agenda realiza la única escritura al confirmar. Limpiar el borrador al enviar, iniciar otra solicitud o cerrar sesión.
- `disponibilidad`: un documento por fecha y franja, con `inicio` como timestamp de las 08:00 o 13:00 de Costa Rica, `franja` (`manana` o `tarde`) y `disponible` booleano. CADISA publica las franjas de lunes a sábado. Consultar las próximas dos semanas y bloquear cualquier día sin franjas disponibles.
- `solicitudes`: generar una referencia automática y mantenerla durante el intento de envío. Guardar `codigo` como `SOL-` seguido de ese ID, `userRef` de la sesión, `servicioId` derivado de `servicioRef.id`, `cupoId`, `fechaPreferida`, `franja`, los datos del borrador, estado `En revisión` y `creadaEn` del servidor. Mostrar la confirmación una vez completada la escritura. La preferencia no reserva una cuadrilla.
- Seguimiento consulta por `userRef` del cliente. Un administrador puede leer todas las solicitudes.
- Cotización: el administrador puede pasar de `En revisión` a `Cotización lista`. Se guardan `montoSinIva`, `iva` y `total` como colones enteros, `notaAdmin`, `cotizadaEn` y `venceEn`. La app usa siete días de vigencia y muestra el aviso al propietario a partir de `cotizadaEn`.
- Respuesta: el propietario de una cotización vigente puede pasar a `Confirmada` o `Cancelada`. Se guarda `respondidaEn` y un `motivoRechazo` opcional. Las reglas bloquean cambios al importe y a los datos originales.
- La demostración requiere al menos un servicio activo y franjas reales de disponibilidad en el mismo proyecto. Para adjuntar y abrir fotos, hace falta integrar el almacenamiento privado de HU-06. El flujo conserva las rutas que reciba.
