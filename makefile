GCP_SERVICE_ACCOUNT = quickstart-1583163005232@appspot.gserviceaccount.com
GCP_FILE = credentials.json
GCP_PROJECT = quickstart-1583163005232
GCP_TOPIC_NAME = example-topic
GCP_SUBSRIPTION_NAME = example-subscription 

FUNCTION_NAME = example-function
FUNCTION_REGION = us-central1
FUNCTION_MEMORY = 256MB
FUNCTION_TIMEOUT = 60
FUNCTION_EXECUTE = messageId
FUNCTION_SOURCE = ./public-message

authentication:
	gcloud auth activate-service-account \
	$(GCP_SERVICE_ACCOUNT) \
	--key-file=$(GCP_FILE) --project=$(GCP_PROJECT)

create-thema:
	gcloud pubsub topics create $(GCP_TOPIC_NAME)

create-subscription:
	gcloud pubsub subscriptions create $(GCP_SUBSRIPTION_NAME) \
    --topic $(GCP_TOPIC_NAME)

public-funtion:
	gcloud functions deploy $(FUNCTION_NAME) --region=$(FUNCTION_REGION) \
		--runtime nodejs8 --memory=$(FUNCTION_MEMORY) --timeout=$(FUNCTION_TIMEOUT) \
		--service-account=$(GCP_SERVICE_ACCOUNT) --trigger-http \
		--entry-point=$(FUNCTION_EXECUTE) --source=$(FUNCTION_SOURCE)
