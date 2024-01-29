#!/usr/bin/env bash

#Move to app source code
cd $INPUT_APP_SOURCE_CODE

npm config set strict-ssl false

#Install dependencies
echo "Installing dependencies"
#npm install > /dev/null 2>&1
npm install

#Build application
echo "Building application"

#Execute the command provided
`echo $INPUT_BUILD_COMMAND` 

#Sync files with amazon s3 bucket app
aws --region $INPUT_AWS_DEFAULT_REGION s3 sync ./dist s3://$INPUT_AWS_BUCKET_NAME --no-progress --delete
