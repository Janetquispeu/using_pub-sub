// Imports the Google Cloud client library
const {PubSub} = require('@google-cloud/pubsub');

// Creates a client
const pubsub = new PubSub();
const topicName = 'projects/quickstart-1583163005232/topics/example-topic';


exports.messageId = async () => {
  // projects/pe-gcp-marketplace-01/topics/prod.business-reports.sale-report.get-orders
  // projects/quickstart-1583163005232/topics/example-topic


  // Publishes the message as a string, e.g. "Hello, world!" or JSON.stringify(someObject)
  const data = "Hello Worl Message Public"
  const dataBuffer = Buffer.from(data);
  await pubsub.topic(topicName).publish(dataBuffer);
  console.log(`Message ${messageId} published.`);
}