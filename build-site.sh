#!/bin/bash

# -------------------------------------------------------------------
# Parametros que pueden depender de la maquina del usuario.
# -------------------------------------------------------------------

DRUPAL_VER='8.0.6'

# ===================== NO EDITAR DESPUES DE ESTO ===================

. 'functions.sh'

print "Building site............"

# Clone repo and add symblink
if [ ! -d $ROOTFS/app/project/docroot ]
then

    print "Downloading latest Drupal Core 8 ..."
    exec "wget -O - https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VER}.tar.gz | tar zxf -"
    exec "mv drupal-${DRUPAL_VER} app/project/docroot"
    exec 'ln -s project/docroot app/docroot'

    DEFAULT_DIR="$ROOTFS/app/docroot/sites/default"

    print "Adding config files ..."
    exec "cp $ROOTFS/default.settings.php $DEFAULT_DIR/settings.php"
    exec "cp $ROOTFS/settings.local.php $DEFAULT_DIR"

    print ''
    print '----------------------------------------------------------------------'
    print 'Entrar a:'
    print '  http://localhost:8000'

else
    print "Directory project/docroot already exists. Aborting."
fi
