#!/bin/bash
if [ ! "$#" -eq "2" ];then
    echo "Número de argumentos inválido"
    exit
fi
if [[ ! "$2" =~ ^[0-9]+$ ]];then
    echo "saldo invalido"
    exit
fi

numPacientes=$(cat pacientes.txt | awk -F "[;]" '{print $3}' | grep -c ^$1$)
echo "Numero de pacientes da cidade $1 : $numPacientes"
c=0
l=1
while [ $l -le $(cat medicos.txt | wc -l) ]
do
    if [ $(awk -F "[;]" '{print $7}' medicos.txt | head -$l | tail -1) -gt "$2" ];then
        c=$(( $c + 1 ))
    fi
    l=$(( $l + 1 ))
done
echo "Numero de medicos com saldos maior que $2 : $c"