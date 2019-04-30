docker-compose -f network/fabric-v1.4/2org2peergoleveldb/docker-compose-tls.yaml down
docker rm $(docker ps -aq);docker rmi $(docker images dev* -q)
rm -rf /data/hyperledger/production1/* /data/hyperledger/production2/* /data/hyperledger/production3/* /data/hyperledger/production4/* /data/hyperledger/production/* /hyperledger/orderer/production/* /hyperledger/peer1/production/* /hyperledger/peer2/production/*
