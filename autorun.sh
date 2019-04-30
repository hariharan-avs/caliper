node scripts/main.js -c benchmark/simple/config_linear.yaml -n network/fabric-v1.4/3org2peergoleveldb/fabric-go-tls.json

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sleep 120

node scripts/main.js -c benchmark/simple/config_linear.yaml -n network/fabric-v1.4/2org2peergoleveldb/fabric-go-tls.json

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sleep 120

node scripts/main.js -c benchmark/simple/config_linear.yaml -n network/fabric-v1.4/2org1peergoleveldb/fabric-go-tls.json

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sleep 120

/opt/intel/storage-snapshot/sps-start.sh

node scripts/main.js -c benchmark/simple/config_long.yaml -n network/fabric-v1.4/3org2peergoleveldb/fabric-go-tls.json

/opt/intel/storage-snapshot/sps-stop.sh

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sleep 120

/opt/intel/storage-snapshot/sps-start.sh

node scripts/main.js -c benchmark/simple/config_long.yaml -n network/fabric-v1.4/2org2peergoleveldb/fabric-go-tls.json

/opt/intel/storage-snapshot/sps-stop.sh

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

sleep 120

/opt/intel/storage-snapshot/sps-start.sh

node scripts/main.js -c benchmark/simple/config_long.yaml -n network/fabric-v1.4/2org1peergoleveldb/fabric-go-tls.json

/opt/intel/storage-snapshot/sps-stop.sh

sleep 60

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
