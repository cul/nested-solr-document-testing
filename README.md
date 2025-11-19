# nested-solr-document-testing

## Requirements for running this script

- Docker
- Ruby 3.3 (probably works with other versions too, but only tested with 3.3)

## Getting Started

1. Run `bundle install`

2. Run `docker compose build && docker compose up` to start the Docker compose process, which will start Solr.  This process will build a Docker image based on the latest conigurations specified in the docker-compose.yml file, and will then run the Docker compose process in the foreground.  You'll want to use a different terminal for the steps that follow.

3. Execute the main script: `ruby ./main.rb`

4. When you're done, go to the terminal window where docker is running, and hit ctrl+c to stop the process.  Then run `docker compose down` to clean up the Solr container.
