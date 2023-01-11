# chatGPT_bash
Script sencillo en bash para conversar con ChatGPT desde la consola

1) Lo primero que debes hacer es ir a la web de OpenAI y acceder al proceso de Login  (https://openai.com/api/login/) allí debes de pulsar sobre 'Sign Up' y crearte una cuenta gratuita con tu email

2) Con la cuenta creada es necesario disponer de un token válido para poder conversar con ChatGPT mediante su API, para ello accederemos a nuestra cuenta y al apartado de API KEYs de OpenAI (https://beta.openai.com/account/api-keys) 

Pulsa sobre View API keys y luego, en la nueva ventana, en el menú de la izquierda pulsa sobre la opción Api Keys

Ahora solamente debemos crear un nuevo 'secret' y copiarlo, ya que solo podemos copiarlo en ese momento, si no lo has copiado deberás de crear de nuevo otro secret y copiarlo.

Guarda el contenido copiado en un fichero que se va a llamar chatGPT.API_KEY, hazlo desde la consola escribiendo:
```
echo 'secret-api-key-generado' > chatGPT.API_KEY
```

NOTA: Es necesario tener instalada la herramienta CURL
```
sudo apt -y install curl
```
