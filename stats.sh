numPacientes=$(cat pacientes.txt | grep -c "$1")
echo "Numero de pacientes da cidade $1 : $numPacientes"
c=0
l=1
while [ $l -le "10" ]
do
    if [ $(awk -F "[;]" '{print $7}' medicos.txt | head -$l | tail -1) -gt "$2" ];then
        c=$(( $x + 1 ))
    fi
    l=$(( $l + 1 ))
done
echo "Numero de medicos com saldos maior que $2 : $c"