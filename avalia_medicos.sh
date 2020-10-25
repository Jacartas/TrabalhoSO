#!/bin/bash
> lista_negra_medicos.txt
l=0
while [ $l -le $(cat medicos.txt | wc -l) ]
do
    if [[ $(head -$l medicos.txt | tail -1 | awk -F "[;]" '{if($6 > 6) print "true"}')  && $(head -$l medicos.txt | tail -1| awk -F "[;]" '{if($5 < 5) print "true"}') ]];then
        cat medicos.txt | head -$l | tail -1 >> lista_negra_medicos.txt
    fi
    l=$(( $l + 1 ))
done
echo "Lista negra de médicos:"
cat lista_negra_medicos.txt