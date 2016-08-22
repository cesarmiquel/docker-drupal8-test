#!/bin/bash

# -------------------------------------------------------------------
# Parametros que pueden depender de la maquina del usuario.
# -------------------------------------------------------------------

DRUPAL_VERSION='8.1.8'

# ===================== NO EDITAR DESPUES DE ESTO ===================

. 'functions.sh'

print "Building site............"

if [ ! -d $ROOTFS/app/docroot ]
then

    print "Downloading latest Drupal Core 8 ..."
    exec "wget -O /tmp/drupal-${DRUPAL_VERSION}.tar.gz https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz"
    exec "mkdir -p app/docroot && tar xf /tmp/drupal-${DRUPAL_VERSION}.tar.gz -C app/docroot --strip-components=1"

    DEFAULT_DIR="$ROOTFS/app/docroot/sites/default"

    print "Adding config files ..."
    exec "cp $ROOTFS/default.settings.php $DEFAULT_DIR/settings.php"
    exec "cp $ROOTFS/settings.local.php $DEFAULT_DIR"

    print "Enabling docker and waiting a little...."
    exec "$ROOTFS/d4d up"

    print "Running a site install ..."
    exec "$ROOTFS/d4d drush si -- -y --account-name=admin --account-pass=qwerty --site-name=TestD8"

    print ''
    print '----------------------------------------------------------------------'
    print 'Ready! Point your browser to your new site. User: admin / Pass: qwerty'
    print '  http://localhost'

else
    print "Directory project/docroot already exists. Aborting."
fi
