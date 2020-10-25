#!/bin/bash
ficheiro="medicos.txt"
if [ ! -f "$ficheiro" ];then
    > medicos.txt
fi
if [ ! "$#" -eq "4" ];then
    echo $#
    echo "Número de argumentos inválido"
    exit
fi
if [[ ! "$2" =~ ^[0-9]+$ ]];then
    echo "número invalido"
    exit
fi
if [[ ! "$4" =~ @{1} ]];then
    echo "email invalido"
    exit
fi
colunaNumero=$(awk -F "[;]" '{print $2}' $ficheiro | grep -c ^$2$ )
colunaMail=$(awk -F "[;]" '{print $4}' $ficheiro | grep -c ^$4$ )
if [ ! $colunaNumero -gt "0" ] && [ ! $colunaMail -gt "0" ]; then
    echo "$1;$2;$3;$4;0;0;0" >> $ficheiro
else
    echo "Medico ja registado"
fi
cat medicos.txt