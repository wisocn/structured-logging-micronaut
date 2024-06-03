#!/bin/bash

# Define the bucket name
BUCKET_NAME="loki-logs"

# Define the object key (name) and the content to upload
OBJECT_KEY="sample-object.txt"
OBJECT_CONTENT="This is a sample object for the loki-logs bucket."

# Define the LocalStack endpoint URL
LOCALSTACK_ENDPOINT="http://localhost:4566"

# Define the AWS CLI profile for LocalStack (if any)
AWS_PROFILE="localstack"

# Create a temporary file for the object content
TEMP_FILE=$(mktemp)
echo $OBJECT_CONTENT > $TEMP_FILE

# Create the S3 bucket
aws --endpoint-url=$LOCALSTACK_ENDPOINT s3 mb s3://$BUCKET_NAME --profile $AWS_PROFILE

# Upload the object to the S3 bucket
aws --endpoint-url=$LOCALSTACK_ENDPOINT s3 cp $TEMP_FILE s3://$BUCKET_NAME/$OBJECT_KEY --profile $AWS_PROFILE

# Verify the bucket and object were created
echo "Buckets in LocalStack:"
aws --endpoint-url=$LOCALSTACK_ENDPOINT s3 ls --profile $AWS_PROFILE

echo "Objects in bucket '$BUCKET_NAME':"
aws --endpoint-url=$LOCALSTACK_ENDPOINT s3 ls s3://$BUCKET_NAME --profile $AWS_PROFILE

# Clean up the temporary file
rm $TEMP_FILE