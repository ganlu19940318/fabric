#!/bin/sh

demoFun(){
	local starttime=$(date +%T)
	peer chaincode invoke -o orderer.example.com:7050  --tls $CORE_PEER_TLS_ENABLED --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem  -C $CHANNEL_NAME -n mycc -c '{"Args":["invoke","a","b","10"]}' 1>/dev/null
	local endtime=$(date +%T)
	echo $starttime $endtime $i >> result.txt
}

start=$(date +%T)
for (( i = 0; i < 9; ++i ))
do
	demoFun & 
done
demoFun
end=$(date +%T)
echo $start $end "-1">> result.txt
