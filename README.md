# closet
Boilerplates and example projects. There are skeletons in the closet

## Conventions
The skeleton projcts all should work out of the box. They are given a
descriptive name based on what they contain. The number at the end of them gives
an idea of how "complex" the boilerplate is. For instance, a "0" means it was
kept as simple as possible just to get a "hello world" to production.

I hope that this will give intuition about how projects should be laid out as
they grow.

# Production
This would be pointless if it didn't walk you through actually pushing
to prod. This repo uses Amazon Lightsail as a simple way to get the
docker containers up and running.

## 1. AWS Account & Amazon Lightsail
Get yourself an aws account and head to the lightsail dashboard (https://lightsail.aws.amazon.com). Set yourself up there. Follow the documentation for setting up the `aws` command line tool (https://aws.amazon.com/cli/) and then finally read through the documentation about running container services (https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-services). Once this is complete and you have set up a "service", you're ready to push containers to it. By the end of step 1, you should have the following pieces of information

 - region: the aws region that you're working with
 - service-name: The name of the service you created for the containers to be deployed to. This should probably be different for each example.

Finally, I had to install the `lightsailctl` plugin (on macos):

    brew install aws/tap/lightsailctl

https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-install-software#install-lightsailctl-on-macos


## 2. Build a "production" version of your image
Each example has a shell function that does this. I like to keep the production envrionments as close to development as possible, so hopefully it won't be too different from your local environment. During this step, you'll have to choose a `name` and `tag` for your image. Check docker's documentation for more info on names and tags.

## 3. Push the image to Lightsail
Again, following the instructions (https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-creating-container-services) in the section "Push container images..." to get your image up to lightsail.

Here is the relevant command:

    aws lightsail push-container-image --region <Region> --service-name <ContainerServiceName> --label <ContainerImageLabel> --image <LocalContainerImageName>:<ImageTag>


## 4. Deploy the container
Use the lightsail console to run your container. Your image should be an option in one of the deployment screens.
