#!/bin/bash
> pacientes.txt
for i in 1 2 3 4 5 6 7 8 9 10
do
    numero=$(cat /etc/passwd | awk '/^a[1-9]+/' | head -10 | awk -F "[:]" '{print $1}' | sed -E "s/a//g" | head -$i | tail -1)
    nome=$(cat /etc/passwd | awk '/^a[1-9]+/' | head -10 | awk -F "[:]" '{print $5}' | sed -E "s/,//g" | head -$i | tail -1)
    email=$(cat /etc/passwd | awk '/^a[1-9]+/' | head -10 | awk -F "[:]" '{print $1}' | head -$i | tail -1)"@iscte-iul.pt"
    echo "$numero;$nome;;;$email;100" >> pacientes.txt
done 
