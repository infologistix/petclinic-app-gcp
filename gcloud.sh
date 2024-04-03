export BRANCH=postgres-feature
export REGION=europe-west3
export TIER=db-f1-micro

gcloud sql instances create $BRANCH \
--database-version=POSTGRES_15 \
--region=$REGION \
--tier=$TIER \
--edition=ENTERPRISE \
--network=vpc-network \
--enable-google-private-path \

--authorized-networks="95.91.214.26", "34.98.79.27" 

