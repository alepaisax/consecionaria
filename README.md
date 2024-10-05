UTILIZACION DE TOKEN 
AL LOGUEAR ADMINISTRADORES, CLIENTES O EMPLEADOS LA RESPUESTA DEL BODY ARROJA UN TOKEN.
EN POSTMAN PESTAÑA "AUTRORIZATION" TYPE "BEARER TOKEN" 
EN "TOKEN"( SE COLOCA EL TOKEN GENERADO SIN COMILLAS NI ESPACIOS)

ADMINISTRADORES 

POST http://localhost:3000/api/administradores/login

{
    "correoElectronico": "jonsno@gmail.com",
    "contrasenia": "nuevaContraseña123" 
}

CREAR TIPO RECLAMO

POST http://localhost:3000/api/administradores/tipos-reclamos

{
    "descripcion": "Mal servicio"
}

LISTAR RECLAMOS

GET http://localhost:3000/api/administradores/tipos-reclamos

ACTUALIZAR TIPO RECLAMO

PUT http://localhost:3000/api/administradores/tipos-reclamos/:id (Reemplaza :id con el ID del tipo de reclamo)

{
    "descripcion": "Mal servicio"
}

ELIMINAR RECLAMO

DELETE http://localhost:3000/api/administradores/tipos-reclamos/:id (Reemplaza :id con el ID del tipo de reclamo)

CREAR EMPLEADO

POST http://localhost:3000/api/administradores/empleados

{
    "nombre": "Tyrion",
    "apellido": "Lannister",
    "correoElectronico": "tyrion.lannister@example.com",
    "contrasenia": "password123",
    "idTipoUsuario": 2,  // es la id de empleado asignada en la BD
    "imagen": "url-a-la-imagen.jpg",  
    "idOficina": 1  // acá le asignan al empleado una de las oficinas en este caso la 1 
}

LISTAR EMPLEADOS

GET http://localhost:3000/api/administradores/empleados

ACTUALIZAR EMPLEADO

PUT http://localhost:3000/api/administradores/empleados/:id

{ 
    "nombre": "Raton", 
    "apellido": "Perez", 
    "correoElectronico": "perezraton@gmail.com", 
    "password": "password123" 
}


ELIMINAR EMPLEADO 

DELETE http://localhost:3000/api/administradores/empleados/:id 

CREAR OFICINA

POST http://localhost:3000/api/administradores/oficinas

{
    "nombre": "Dpto. de Repuestos y Partes",
    "idReclamoTipo": 3,
    "activo": 1
}

LISTAR OFICINAS

GET http://localhost:3000/api/administradores/oficinas

ACTUALIZAR OFICINAS

PUT http://localhost:3000/api/administradores/oficinas/:id

{
    "nombre": "Devoluciones",
    "idReclamoTipo": 4,
    "activo": 1
}

ELIMINAR OFICINA

DELETE http://localhost:3000/api/administradores/oficinas/:id

VER ESTADISTICAS 

GET http://localhost:3000/api/administradores/estadisticas-reclamos 
(Algo así deberían ver en la respuesta)
{
    "total_reclamos": 5,
    "reclamos_pendientes": "3",
    "reclamos_atendidos": "0"
}

DESCARGAR CSV

GET http://localhost:3000/api/administradores/reclamos/descargar/csv
(muestra algo así ..)
"idReclamo","asunto","descripcion","fechaCreado","fechaFinalizado","fechaCancelado","idReclamoEstado","idReclamoTipo","idUsuarioCreador","idUsuarioFinalizador"
5,"ruido en motor",,"2024-08-19T09:00:00.000Z",,,1,1,9,
6,"rotura de  motor ",,"2024-08-19T10:00:00.000Z",,,4,1,8,
7,"no frena",,"2024-08-15T10:15:00.000Z",,,1,2,8,
8,"ruidos extraños",,"2024-08-15T11:00:00.000Z",,,1,3,7,
9,"Falla en la transmisión","Descripción del problema aquí","2024-10-05T18:09:17.000Z",,,3,1,22,


GET http://localhost:3000/api/administradores/reclamos/descargar/pdf (FUNCIONA PERO NO VISUALIZO EL PDF)


CLIENTES 

REGISTRO
POST http://localhost:3000/api/clientes/registro

{
    "nombre": "jose",
    "apellido": "Uner",
    "correoElectronico": "jose@hotmail.com",
    "contrasenia": "uner123" 
}

LOGIN
POST http://localhost:3000/api/clientes/login
{
    "correoElectronico": "jose@hotmail.com",
    "contrasenia": "uner123"
}

VER OFICINAS DE RECLAMO (esto es para que al momento de crear un reclamo el mismo sea asignado a la oficina correspondiente)

GET http://localhost:3000/api/clientes/oficinas

CREAR RECLAMO 

POST http://localhost:3000/api/clientes/reclamos
{
    "asunto": "Falla en la transmisión",
    "descripcion": "Ruidos continuos",
    "idOficina": 1 
}
respuesta..
{
    "message": "Reclamo creado",
    "idReclamo": x // El ID que arroje va a servir para las consultas 
}

VER RECLAMO DEL CLIENTE

GET http://localhost:3000/api/clientes/reclamos/9  //esta el id 9 ES EL RECLAMO CREADO POR ESTE CLIENTE

CANCELAR RECLAMO

PUT http://localhost:3000/api/clientes/reclamos/:idReclamo/cancelar

ACTUALIZAR EL PERFIL DEL CLIENTE

PUT http://localhost:3000/api/clientes/perfil
{
    "nombre": "Juan",
    "apellido": "Gómez",
    "correoElectronico": "jose@hotmail.com"
}


EMPLEADOS 

POST http://localhost:3000/api/empleados/login

{
  "correoElectronico": "perezraton@gmail.com",  // el ratón es id 24 
  "contrasenia": "password123"
}

VER LOS RECLAMOS ASIGNADOS A SU OFICINA 

GET http://localhost:3000/api/empleados/reclamos

ATENDER RECLAMO

PUT http://localhost:3000/api/empleados/reclamos/:IDreclamo/atender

{
    "idReclamo": 11, 
    "nuevoEstado": 2, 
    "comentarios": "El problema se ha solucionado" 
}

VER LOS RECLAMOS ATENDIDOS POR EL EMPLEADO 

GET http://localhost:3000/api/empleados/reclamos/atendidos
