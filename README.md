# Proyecto Bases de Datos I

![Alt text](/info/screenshots/login.png?raw=true)

![Alt text](/info/screenshots/exam_form.png?raw=true)

# Este proyecto está licenciado bajo GPLv3, puedes hacer lo que quieras con él desde que respetes los términos del software libre

# Modelo Entidad Relación

![Alt text](/backend/EER.png?raw=true)

## ¿Qué utiliza este proyecto?

### Node JS para el backend
### Flutter y Dart para el frontend
### PostgreSQL como base de datos

## ¿Qué necesita para ejecutarlo?

### Node JS
### SDK de Flutter
### Servidor de PostgreSQL

## ¿Cómo ejecuto este proyecto?

### La base de datos debe estar escuchando en el puerto 5432, el script para crearla se encuentra en el directorio backend
### Ejecute la aplicación servidor del backend, en el directorio deberían estar las instrucciones
### Ejecute la aplicación flutter, dicho proyecto está en el directorio con su mismo nombre

## ¿Cómo rayos funciona esto?

El proyecto backend se encarga de conectarse a la base de datos, es básicamente una API REST que nos permite recibir y enviar objetos JSON desde mensajes HTTP, de esta forma  no necesitamos mapear los objetos manualmente y nos facilita la vida, mientras al mismo tiempo nos permite utilizar las consultas nativas de SQL, en este proyecto no hay nada de frameworks ORM ya que no nos daría el mismo resultado de aprendizaje y el profe nos regaña

# El backend y únicamente el backend se comunica con la base de datos

El proyecto flutter funciona como frontend, se comunica con el servidor de backend y consume sus servicios, que en este caso serán mensajes de solicitud HTTP, mapearemos objetos de Dart y los convertiremos a un formato JSON para que el backend pueda interpretarlos y darle una respuesta al usuario. Al momento de la respuesta, se recibe un mensaje de respuesta HTTP, tomamos el body de dicho mensaje y mapeamos el objeto JSON a un objeto Dart. La ventaja que ofrece esto es que simplemente necesitamos llamar atributos para mostrarlos en la interfaz gráfica ¡Casi todo lo hace el backend!

# Lo más complejo será estructurar las consultas y retornar un JSON correctamente, después de esto, mapear a objetos es bastante sencillo
