const { readFileSync } = require('node:fs');
const { resolve } = require('node:path');
const { test, before, after } = require('node:test');
const { initializeTestEnvironment, assertSucceeds, assertFails } = require('@firebase/rules-unit-testing');
const { doc, setDoc, getDoc, updateDoc, deleteDoc, getDocs, collection, deleteField, Timestamp } = require('firebase/firestore');

let entorno;
const perfil = (uid, rol = 'cliente') => ({ uid, rol, email: `${uid}@example.test`, display_name: 'Prueba', created_time: Timestamp.now() });
const db = (uid) => entorno.authenticatedContext(uid).firestore();
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
test('bloquea colecciones todavía no autorizadas', () => assertFails(setDoc(doc(db('cliente'), 'solicitudes/prueba'), {userRef: 'cliente'})));
