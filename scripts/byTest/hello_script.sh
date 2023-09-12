#!/bin/bash

NOMBRE=$1
APELLIDO=$2
SHOW=$3

if [ "$SHOW" = "true" ]; then
      echo "Hola, $NOMBRE $APELLIDO"
else
      echo "Si quieres ver el nombre, selecciona la casilla de mostrar"

fi
