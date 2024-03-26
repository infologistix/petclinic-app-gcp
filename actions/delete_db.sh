#!/bin/bash
. actions/db_parameters

echo "You deleted the Branch $BRANCH"
RandomID=$(cksum <<< $BRANCH | cut -f 1 -d ' ')

server=$name-$RandomID
echo "Deleting the Postgres Server $server"
echo $server

az postgres flexible-server delete  \
	--resource-group $resource_group \
	--name $server \
	--yes
