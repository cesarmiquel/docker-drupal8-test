FROM d4d/mu-composer

# Install Drush 8.
RUN composer global require drush/drush:8.*
RUN composer global update

# Adding the composer vendor dir to the PATH doesn't seem to work. So:
RUN ln -s /root/.composer/vendor/bin/drush.php /usr/local/bin/drush

# Display which version of Drush was installed
RUN drush --version

ENTRYPOINT ["/usr/local/bin/drush"]
