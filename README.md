## Goal
- Show how to use Oracle 11g xe container version and Debezium Connector to make a logminer CDC process

## Dependency
- oracle-xe-11g-r2
- Debezium Connector for Oracle 1.5

## Usage
- run ./setup.sh
- You can use akhq which launched by docker-compose to browse or manipulate kafka data

## Issues
- Source data will take a lot of time (about 30 seconds) to write to the topic
- Throw kafaka warning: `WARN [Producer clientId=connector-producer-oracle1-0] Error while fetching metadata with correlation id 3 : {netstream=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)`
- When the connector is placed for a period of time, the source will not be able to be written to the topic

## References
- https://github.com/saubury/kafka-connect-oracle-cdc
- https://github.com/confluentinc/demo-scene/tree/master/no-more-silos-oracle
- https://debezium.io/releases/