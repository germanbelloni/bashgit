#!/bin/bash
if [ ! -d "bashgit" ]; then
  mkdir bashgit
  cd bashgit
  echo "# bashgit" >> README.md
  git init
  git add README.md
  git commit -m "primer commit del tp"
  git branch -M main
  git remote add origin https://github.com/germanbelloni/bashgit.git


  git push -u origin main

  git checkout -b developer
  echo "Se creó y se movió a la rama developer."

  if [ ! -f "main.js" ]; then
   # Crear el archivo "main.js" solo si no existe
   echo "Creo archivo main.js"
   touch main.js
   echo "console.log('Archivo creado satisfactoriamente')" >> main.js
   git add main.js
   git commit -m "Agrego el archivo main.js"
   git push -u origin developer -o merge_request.title="Merge Request main.js"

   #Mergeo rama developer a main
   git checkout main
   git merge developer
   git push origin main
  fi
else
  echo "La carpeta bashgit ya existe"
fi