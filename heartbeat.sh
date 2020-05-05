#!/bin/bash
echo "heartbeat.sh : hbs=" $bhs
echo "heartbeat.sh : HEARTBEATSTEP=" $bHEARTBEATSTEP
echo "param1=" $1

if [ -z "$HEARTBEATSTEP" ]; then
    echo "La variable d'environnement HEARTBEATSTEP doit avoir une valeur!";
    exit 1;
fi

while true;
do
    echo $1 \($(date +%H:%M:%S)\);
    sleep "$HEARTBEATSTEP";
done
