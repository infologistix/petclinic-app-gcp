#!/bin/bash
. actions/db_parameters

# Create the ID by taking a Hash of the Branchname
echo "You are on the Branch ${GITHUB_REF##*/}"
RandomID=$(cksum <<< ${GITHUB_REF##*/} | cut -f 1 -d ' ')
echo "The ID of this session is $RandomID"

server=$name-$RandomID
echo "The Servername is $server"

echo "Creating Server..."
az postgres flexible-server create \
	--location $location \
	--resource-group $resource_group \
    	--name $server \
	--admin-user $admin_user \
	--admin-password $admin_password \
   	--sku-name $sku_name \
	--tier $tier \
	--public-access $public_access \
	--storage-size $storage_size \
  	--tags $tags \
    	--version $version \
	--high-availability $high_availability


# Fill with data from sql-file
echo "Create tables and insert data ..."
az postgres flexible-server execute \
	-n $server \
	-u $admin_user \
	-p $admin_password \
	-d $db \
	--file-path src/main/resources/create_and_fill.sql
 

# # # Run query on db
echo "Show the output of a table"
az postgres flexible-server execute \
 	-n $server \
 	-u $admin_user \
 	-p $admin_password \
 	-d $db \
 	-q "select * from pets;" \
 	--output table
