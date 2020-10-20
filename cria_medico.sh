ficheiro="medicos.txt"
if [ ! -f "$ficheiro" ];then
    > medicos.txt
fi
coluna=$(awk -F "[;]" '{print $2}' $ficheiro | grep -c "$2")
if [ ! $coluna -gt "0" ]; then
    echo "$1;$2;$3;$4;0;0;0" >> $ficheiro
else
    echo "Medico ja registado"
fi
cat medicos.txt