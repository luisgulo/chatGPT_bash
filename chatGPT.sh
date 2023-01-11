#!/bin/bash

# Cargar la clave de API de ChatGPT
API_KEY=$(cat chatGPT.API_KEY)
LOG="conversaciones-ChatGPT.txt"
echo "-----------------------" 
echo " Conversar con ChatGPT "
echo "-----------------------" 
echo
# Establece la URL del API de ChatGPT
CHATGPT_URL="https://api.openai.com/v1/completions"

# Bucle principal del programa
while true; do
  # Solicitar una pregunta al usuario
  echo -n "> $USER escribe una pregunta (o 'salir'): "
  read pregunta

  # Si escribe "salir", salimos del programa
  if [ "$pregunta" == "salir" ]; then
    break
  fi
  echo "Pregunta: "$pregunta >> $LOG

  # Utiliza la herramienta "curl" en modo silencioso para enviar la pregunta al API de ChatGPT y obtener la respuesta del chatbot
  echo -e "                        ... ChatGPT pensando ...\n"
  respuesta=$(curl -s https://api.openai.com/v1/completions -H "Content-Type: application/json" -H "Authorization: Bearer $API_KEY" -d "{\"model\": \"text-davinci-003\", \"prompt\": \"$pregunta\", \"temperature\": 0, \"max_tokens\": 1000}")

  # Extrae la respuesta del chatbot de la respuesta JSON de la API
  respuesta_chatgpt=$(echo $respuesta |awk -F 'text":"' '{print $2}'|awk -F '","index"' '{print $1}'| awk -F '\n\n' '{print $1}')

  # Descomentar para debug del JSON
  #echo $respuesta
 
  # Muestra la respuesta del chatbot en la consola
  echo -e "> ChatGPT: $respuesta_chatgpt\n" | tee -a $LOG
  echo "----------------------------------------------------------------------------------" |tee -a $LOG
done

