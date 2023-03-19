#!/bin/bash

#
#chmod +x rom_creator.sh
#./rom_creator.sh
read -p "HI!: \n    Compile: c\n     Map: m" ACCION
read -p "Project name: " FILE
if [  $ACCION=="c" ]
then
    rgbasm -L -o ${FILE}.o ${FILE}.asm
    rgblink -o ${FILE}.gb ${FILE}.o
    rgbfix -v -p 0xFF ${FILE}.gb
elif [ $ACCION=="m" ]
then
    rgblink ${FILE}.o -m ${FILE}.map
else
    echo "ADIOS :)"
fi