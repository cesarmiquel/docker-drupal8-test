FROM d4d/mu-composer

# Install Drush 8.
RUN composer global require drupal/console:@stable
#RUN composer global update

# Adding the composer vendor dir to the PATH doesn't seem to work. So:
RUN ln -s /root/.composer/vendor/bin/drupal /usr/local/bin/drupal

# Display which version of Drush was installed
RUN drupal --version

ENTRYPOINT ["/usr/local/bin/drupal"]
