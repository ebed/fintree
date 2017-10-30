# FinntreeApp

Servicio Proxy de autenticación. Los endpoints disponibilizados son 2.

## Instalación local
 Descargar los fuentes con 
 ```
 git clone https://github.com/ebed/fintree.git
 ```

 Luego se deben configurar los parametros importantes en el archivo application.yml
 ```
 	PORCENTAJE_DIFERENCIA_IMAGEN: '90'
	HOSTNAME_PORT: 'localhost:3000'
	EMAIL_USERNAME: 'usuario smtp'
	EMAIL_PASSWORD: 'password usuario SMTP'
	CORREO_AVISOS: ' correo de a quien se le enviaran los correos'
	PROTOCOLO_SERVER: 'http' # Protocolo del servidor, en localhost se utiliza HTTP, para produccion debende del servidor, usualmente HTTPS
	SMTP_SERVER: 'servidor SMTP'
	SMTP_PORT: 'puerto de SMTP, por ejemplo 587'
	 
 ```

Es necesario obtener las gemas necesarias, por lo que se deberá ejecutar el comando
	```
	bundle install
	```


Para el ambiente local, se está utilizando sqlite3, por lo que no se requiere usuario ni password
Se debe montar la base de datos 
```
	rake db:create
	rake db:migrate
```

Y realizar la inserción de los datos necesarios para partir 
```
rake db:seed
```

### Servicios
	```
	POST: /rest/login
	Parametros entrada: 
	{
		"email":"test@test.com",
		"image":"dfsdfdgfdfgdfgfdg...." (imagen encoded en BASE64, en formato STRING)
	}

	Respuesta:
	Para el caso Exitoso, HTTP status 200
	{
		“message”:”OK”
	}

	Para el caso sin autorizacion: HTTP status 401:
	{
		“message”:”No Autorizado”
	}
	```

	```
	POST: /rest/verify_user
	Parametros Entrada: 
	{ 
		"image":"dfsdfdgfdfgdfgfdg...." (imagen encoded en BASE64, en formato STRING)
	}
		Respuesta:
	Para el caso Exitoso, HTTP status 200
	{
		“message”:”OK”
	}

	Para el caso sin autorizacion: HTTP status 401:
	{
		“message”:”No Autorizado”
	}

	```

### Verificar servicio
Para probar el servicio, se puede utilizar CURL con la siguiente estructura :
```
Datos incluidos validos para probar localmente

curl -d '{"email":"ignacio@acid.cl", "image":"TWFuIGlzIGRpc3Rpbmd1aXNoZWQsIG5vdCBvbmx5IGJ5IGhpcyByZWFzb24sIGJ1dCBieSB0aGlzIHNpbmd1bGFyIHBhc3Npb24gZnJvbSBvdGhlciBhbmltYWxzLCB3aGljaCBpcyBhIGx1c3Qgb2YgdGhlIG1pbmQsIHRoYXQgYnkgYSBwZXJzZXZlcmFuY2Ugb2YgZGVsaWdodCBpbiB0aGUgY29udGludWVkIGFuZCBpbmRlZmF0aWdhYmxlIGdlbmVyYXRpb24gb2Yga25vd2xlZGdlLCBleGNlZWRzIHRoZSBzaG9ydCB2ZWhlbWVuY2Ugb2YgYW55IGNhcm5hbCBwbGVhc3VyZS4"}' -H "Content-Type: application/json" -X POST http://localhost:3000/rest/login



```

=