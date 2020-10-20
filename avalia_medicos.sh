> lista_negra_medicos.txt
l=0
while [ $l -le $(cat medicos.txt | wc -l) ]
do
    if [[ $(awk -F "[;]" '{print $5}' medicos.txt | head -$l | tail -1) < "5" ]] && [[ $(awk -F "[;]" '{print $6}' medicos.txt | head -$l | tail -1) > "6" ]];then
        cat medicos.txt | head -$l | tail -1 >> lista_negra_medicos.txt
    fi
    l=$(( $l + 1 ))
done
echo "Lista negra de médicos:"
cat lista_negra_medicos.txt