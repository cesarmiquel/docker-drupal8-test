# Drupal 8 lightweight containers

This Docker images and scripts will allow you to have a Drupal 8 up and running with Drush and Drupal Console.

## First Initialization

Make sure there are no running containers with:

        $ ./d4d ps

You'll need to build your environment for the first time with the following commands:

        $ . env.sh
        $ d4d build
        $ ./build-site.sh

Once the build-site.sh script is done you will have a D8 site ready at the following URL:

*  http://localhost:8000/

To halt the containers do:

        $ d4d down

