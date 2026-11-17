const { readFileSync } = require('node:fs');
const { resolve } = require('node:path');
const { test, before, after } = require('node:test');
const { initializeTestEnvironment, assertSucceeds, assertFails } = require('@firebase/rules-unit-testing');
const { doc, setDoc, getDoc, updateDoc, deleteDoc, getDocs, collection, deleteField, Timestamp, query, where, serverTimestamp } = require('firebase/firestore');

let entorno;
const perfil = (uid, rol = 'cliente') => ({ uid, rol, email: `${uid}@example.test`, display_name: 'Prueba', created_time: Timestamp.now() });
const db = (uid) => entorno.authenticatedContext(uid).firestore();
const ahora = Date.now();
const enDias = (dias) => Timestamp.fromMillis(ahora + dias * 86400000);
const crearSolicitud = (bd, id, cambios = {}) => setDoc(doc(bd, 'solicitudes', id), {
  codigo: `SOL-${id}`,
  userRef: doc(bd, 'users/cliente'),
  servicioRef: doc(bd, 'servicios/limpieza'),
  servicioId: 'limpieza',
  tipoInmueble: 'Residencial',
  areaCantidad: 12.5,
  direccion: 'San José, casa de prueba',
  fotos: [],
  cupoId: 'abierto',
  fechaPreferida: enDias(1),
  franja: 'manana',
  estado: 'En revisión',
  creadaEn: serverTimestamp(),
  ...cambios,
});
before(async () => {
  entorno = await initializeTestEnvironment({
    projectId: 'demo-cadisa-reglas',
    firestore: {host: '127.0.0.1', port: 8188, rules: readFileSync(resolve(__dirname, '../firestore.rules'), 'utf8')},
  });
  await entorno.withSecurityRulesDisabled(async (contexto) => {
    const datosPrueba = contexto.firestore();
    for (const uid of ['cliente', 'otro', 'admin']) {
      await setDoc(doc(datosPrueba, 'users', uid), perfil(uid, uid === 'admin' ? 'admin' : 'cliente'));
    }
    await setDoc(doc(datosPrueba, 'servicios/limpieza'), { activo: true });
    await setDoc(doc(datosPrueba, 'servicios/inactivo'), { activo: false });
    for (const [id, dias, disponible] of [['abierto', 1, true], ['cerrado', 2, false], ['pasado', -1, true], ['lejano', 15, true]]) {
      await setDoc(doc(datosPrueba, 'disponibilidad', id), { inicio: enDias(dias), franja: 'manana', disponible });
    }
  });
});
after(async () => { if (entorno) await entorno.cleanup(); });

test('registro: perfil básico de FlutterFlow y actualización posterior', async () => {
  const referencia = doc(db('nuevo'), 'users/nuevo');
  const datos = perfil('nuevo');
  delete datos.rol;
  await assertSucceeds(setDoc(referencia, datos));
  await assertSucceeds(updateDoc(referencia, {rol: 'cliente', tipo: 'fisica', cedula: '123', phone_number: '88881234'}));
});
test('registro: creación propia con rol cliente', () => assertSucceeds(setDoc(doc(db('empresa'), 'users/empresa'), {...perfil('empresa'), tipo: 'empresa'})));
test('registro: consulta del documento propio inexistente', () => assertSucceeds(getDoc(doc(db('inexistente'), 'users/inexistente'))));
test('bloquea crear perfil ajeno', () => assertFails(setDoc(doc(db('cliente'), 'users/ajeno'), perfil('ajeno'))));
test('bloquea crear un administrador desde el cliente', () => assertFails(setDoc(doc(db('intruso'), 'users/intruso'), perfil('intruso', 'admin'))));
test('bloquea UID distinto al documento', () => assertFails(setDoc(doc(db('nuevoUid'), 'users/nuevoUid'), perfil('otroUid'))));
test('bloquea campos no declarados al crear', () => assertFails(setDoc(doc(db('extra'), 'users/extra'), {...perfil('extra'), permisos: ['admin']})));
test('bloquea creación anónima', () => assertFails(setDoc(doc(entorno.unauthenticatedContext().firestore(), 'users/anonimo'), perfil('anonimo'))));
test('cliente puede leer su perfil', () => assertSucceeds(getDoc(doc(db('cliente'), 'users/cliente'))));
test('cliente no puede leer otro perfil', () => assertFails(getDoc(doc(db('cliente'), 'users/otro'))));
test('anónimo no puede leer perfiles', () => assertFails(getDoc(doc(entorno.unauthenticatedContext().firestore(), 'users/cliente'))));
test('cliente no puede listar usuarios', () => assertFails(getDocs(collection(db('cliente'), 'users'))));
test('administrador puede leer perfiles', () => assertSucceeds(getDoc(doc(db('admin'), 'users/cliente'))));
test('administrador puede listar perfiles', () => assertSucceeds(getDocs(collection(db('admin'), 'users'))));
test('cliente puede actualizar datos de contacto', () => assertSucceeds(updateDoc(doc(db('cliente'), 'users/cliente'), {display_name: 'Nombre editado', phone_number: '88880000'})));
test('cliente no puede elevar su rol', () => assertFails(updateDoc(doc(db('cliente'), 'users/cliente'), {rol: 'admin'})));
test('cliente no puede cambiar su UID', () => assertFails(updateDoc(doc(db('cliente'), 'users/cliente'), {uid: 'otro'})));
test('cliente no puede cambiar la fecha de creación', () => assertFails(updateDoc(doc(db('cliente'), 'users/cliente'), {created_time: Timestamp.fromMillis(0)})));
test('cliente no puede escribir en otro perfil', () => assertFails(updateDoc(doc(db('cliente'), 'users/otro'), {display_name: 'Alterado'})));
test('administrador no puede editar perfiles ajenos desde la app', () => assertFails(updateDoc(doc(db('admin'), 'users/cliente'), {rol: 'admin'})));
test('administrador no puede quitar su rol desde la app', () => assertFails(updateDoc(doc(db('admin'), 'users/admin'), {rol: deleteField()})));
test('bloquea tipos de datos incorrectos', () => assertFails(updateDoc(doc(db('cliente'), 'users/cliente'), {phone_number: 88880000})));
test('bloquea borrar el perfil propio', () => assertFails(deleteDoc(doc(db('cliente'), 'users/cliente'))));
test('bloquea borrar perfiles ajenos como admin', () => assertFails(deleteDoc(doc(db('admin'), 'users/otro'))));
test('bloquea colecciones todavía no autorizadas', () => assertFails(setDoc(doc(db('cliente'), 'calificaciones/prueba'), {userRef: 'cliente'})));

test('catálogo solo lista servicios activos y autenticados', async () => {
  const servicios = collection(db('cliente'), 'servicios');
  await assertSucceeds(getDocs(query(servicios, where('activo', '==', true))));
  await assertFails(getDocs(servicios));
  await assertFails(getDoc(doc(entorno.unauthenticatedContext().firestore(), 'servicios/limpieza')));
});

test('cliente consulta disponibilidad pero no la modifica', async () => {
  const cupo = doc(db('cliente'), 'disponibilidad/abierto');
  await assertSucceeds(getDoc(cupo));
  await assertFails(updateDoc(cupo, { disponible: false }));
});

test('cliente guarda su solicitud, consulta su historial y no puede duplicar el código', async () => {
  const bd = db('cliente');
  const id = 'solicitud00000000001';
  const referencia = doc(bd, 'solicitudes', id);
  await assertSucceeds(crearSolicitud(bd, id));
  await assertSucceeds(getDoc(referencia));
  await assertSucceeds(getDocs(query(collection(bd, 'solicitudes'), where('userRef', '==', doc(bd, 'users/cliente')))));
  await assertFails(crearSolicitud(bd, id));
  await assertFails(updateDoc(referencia, { estado: 'Confirmada' }));
  await assertFails(getDoc(doc(db('otro'), 'solicitudes', id)));
  await assertSucceeds(getDocs(collection(db('admin'), 'solicitudes')));
});

test('impide crear solicitudes ajenas, cotizadas o con servicio inactivo', async () => {
  const bd = db('cliente');
  const id = 'solicitud00000000002';
  await assertFails(crearSolicitud(bd, id, { userRef: doc(bd, 'users/otro') }));
  await assertFails(crearSolicitud(bd, id, { estado: 'Confirmada' }));
  await assertFails(crearSolicitud(bd, id, { total: 11300 }));
  await assertFails(crearSolicitud(bd, id, { servicioRef: doc(bd, 'servicios/inactivo'), servicioId: 'inactivo' }));
  await assertFails(crearSolicitud(bd, id, { servicioRef: doc(bd, 'servicios/inactivo') }));
});

test('impide guardar una preferencia cerrada, pasada, fuera del rango o distinta al cupo', async () => {
  const bd = db('cliente');
  const id = 'solicitud00000000003';
  await assertFails(crearSolicitud(bd, id, { cupoId: 'cerrado', fechaPreferida: enDias(2) }));
  await assertFails(crearSolicitud(bd, id, { cupoId: 'pasado', fechaPreferida: enDias(-1) }));
  await assertFails(crearSolicitud(bd, id, { cupoId: 'lejano', fechaPreferida: enDias(15) }));
  await assertFails(crearSolicitud(bd, id, { franja: 'tarde' }));
  await assertFails(crearSolicitud(bd, id, { fechaPreferida: enDias(2) }));
});

test('impide guardar un formulario incompleto o un código distinto al documento', async () => {
  const bd = db('cliente');
  const id = 'solicitud00000000004';
  await assertFails(crearSolicitud(bd, id, { areaCantidad: 0 }));
  await assertFails(crearSolicitud(bd, id, { direccion: '   ' }));
  await assertFails(crearSolicitud(bd, id, { codigo: 'SOL-1047' }));
  await assertFails(crearSolicitud(bd, id, { creadaEn: enDias(-1) }));
});

const cotizacion = (cambios = {}) => ({
  estado: 'Cotización lista',
  montoSinIva: 50,
  iva: 7,
  total: 57,
  notaAdmin: '',
  cotizadaEn: serverTimestamp(),
  venceEn: enDias(7),
  ...cambios,
});

test('solo un administrador puede cotizar con IVA correcto y conservar los datos del cliente', async () => {
  const cliente = db('cliente');
  const id = 'solicitud00000000005';
  const ruta = `solicitudes/${id}`;
  const admin = doc(db('admin'), ruta);
  await assertSucceeds(crearSolicitud(cliente, id));
  await assertFails(updateDoc(doc(cliente, ruta), cotizacion()));
  await assertFails(updateDoc(admin, cotizacion({ iva: 6, total: 56 })));
  await assertFails(updateDoc(admin, cotizacion({ total: 58 })));
  await assertFails(updateDoc(admin, cotizacion({ venceEn: enDias(-1) })));
  await assertFails(updateDoc(admin, cotizacion({ direccion: 'Otra dirección' })));
  await assertSucceeds(updateDoc(admin, cotizacion()));
  await assertFails(updateDoc(admin, cotizacion({ notaAdmin: 'Cambiar después' })));
  await assertSucceeds(getDoc(doc(cliente, ruta)));
});

test('solo el dueño acepta una cotización vigente sin alterar su precio', async () => {
  const cliente = db('cliente');
  const id = 'solicitud00000000006';
  const ruta = `solicitudes/${id}`;
  const referencia = doc(cliente, ruta);
  const acepta = { estado: 'Confirmada', respondidaEn: serverTimestamp() };
  await assertSucceeds(crearSolicitud(cliente, id));
  await assertFails(updateDoc(referencia, acepta));
  await assertSucceeds(updateDoc(doc(db('admin'), ruta), cotizacion()));
  await assertFails(updateDoc(doc(db('otro'), ruta), acepta));
  await assertFails(updateDoc(referencia, { ...acepta, total: 1 }));
  await assertSucceeds(updateDoc(referencia, acepta));
  await assertFails(updateDoc(referencia, { ...acepta, estado: 'Cancelada' }));
});

test('permite rechazar con motivo y bloquea responder una cotización vencida', async () => {
  const cliente = db('cliente');
  const id = 'solicitud00000000007';
  const ruta = `solicitudes/${id}`;
  const rechaza = { estado: 'Cancelada', motivoRechazo: 'Cambio de planes', respondidaEn: serverTimestamp() };
  await assertSucceeds(crearSolicitud(cliente, id));
  await assertSucceeds(updateDoc(doc(db('admin'), ruta), cotizacion()));
  await assertSucceeds(updateDoc(doc(cliente, ruta), rechaza));
  const vencida = 'solicitudes/solicitud00000000008';
  await entorno.withSecurityRulesDisabled(async (contexto) => {
    const bd = contexto.firestore();
    await setDoc(doc(bd, vencida), { ...cotizacion({ venceEn: enDias(-1) }), userRef: doc(bd, 'users/cliente') });
  });
  await assertFails(updateDoc(doc(cliente, vencida), rechaza));
});
