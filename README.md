# FinntreeApp

Servicio Proxy de autenticación. Los endpoints disponibilizados son 2.

## Instalación
 Descargar los fuentes con 
 ```
 git clone ....
 ```

 Luego se deben configurar los parametros importantes en el archivo application.yml
 ```
 	fdfd
 ```

Es necesario obtener las gemas necesarias, por lo que se deberá ejecutar el comando
	```
		bundle install
	```

Se debe montar la base de datos 
```
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
Para probar el servicio, se puede utilizar CURL con la siguiente estructura:
```
curl ....

```