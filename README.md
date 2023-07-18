# CURSOS BOOTCAMP

Dado el siguiente modelo relacional:

![db](./public/db.png)

Adicionalmente se utiliza JWT para validar login de usuarios y bcrypt para protección de contraseñas.

## Setup del proyecto

```console
npm install
```

### Compilando para desarrollo

```console
npm run dev
```

### Importante: Se utilizan variables de entorno

Debes configurar tu archivo .env en la raíz del proyecto que coincidan con las mostradas en:

```
/.env.example
```

## Contenido del proyecto:

### Puedes importar el respaldo de la base de datos

Lo encuentras en:

```
/public/bkp_database.sql
```

### Tambien puedes utilizar los seeds para crear Usuarios y Bootcamps

```console
node seeds.js
```

Luego puedes inscribir Usuarios a Bootcamps a través de consultas a la API o simplemente utilzando las vistas de la aplicación cliente.

### Puedes usar las consultas precargadas e importarlas en Postman

Las encuentras en:

```
/public/consultas_postman
```

## Consultas

- Consultando el Bootcamp por id, incluyendo los usuarios.

```bash

<!-- GET -->

http://localhost:3000/api/v1/bootcamp/id/1


```

- Listar todos los Bootcamp con sus usuarios.

```bash

<!-- GET -->

http://localhost:3000/api/v1/bootcamp


```

- Consultar un usuario por id, incluyendo los Bootcamp.

```bash

<!-- GET -->

http://localhost:3000/api/v1/user/id/1

```

- Listar los usuarios con sus Bootcamp

```bash

<!-- GET -->

http://localhost:3000/api/v1/user

```

- Actualizar el usuario según su id; por ejemplo: actualizar el usuario con id=1 por Pedro Sánchez.

```bash

<!-- PUT -->

http://localhost:3000/api/v1/user/id/1

```

```json
{
	"firstName": "Pedro",
	"lastName": "Sánchez",
	"email": "mateo.diaz@correo.com"
}
```

- Eliminar un usuario por id; por ejemplo: el usuario con id=1.

```bash

<!-- DELETE -->

http://localhost:3000/api/v1/user/id/1

```
