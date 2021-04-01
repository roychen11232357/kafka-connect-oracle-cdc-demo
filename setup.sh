#!/bin/bash

echo -e $(date) "Firing up Oracle"
docker-compose up -d oracle

# ---- Wait for Oracle DB to be up (takes several minutes to instantiate) ---
echo -e "\n--\n\n$(date) Waiting for Oracle to be available … ⏳"
grep -q "System altered" <(docker logs -f oracle)

echo -e $(date) "Firing up the rest of the stack"


docker-compose exec oracle bash -c '/scripts/add_recovery_folder.sh'
docker-compose exec oracle /scripts/go_sqlplus.sh /scripts/oracle_setup_docker

docker-compose up -d

echo -e "\n--\n\n$(date) Waiting for Kafka-connect to be available … ⏳"
grep -q "Finished starting connectors and tasks" <(docker logs -f kafka-connect)

echo -e $(date) "All things dona, bye!"





    
