#!/bin/bash

# -------------------------------------------------------------------
# Parametros que pueden depender de la maquina del usuario.
# -------------------------------------------------------------------

GIT=`which git`
GIT_REPO_URL="git@bitbucket.org:kurobits/condo-profile.git"
GIT_BRANCH="feature/new-theme"
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

    #echo '' >> $DEFAULT_DIR/settings.php
    #echo '// read local settings' >> $DEFAULT_DIR/settings.php
    #echo 'if (file_exists(__DIR__ . "/local.settings.php")) {' >> $DEFAULT_DIR/settings.php
    #echo ' require(__DIR__ . "/local.settings.php");' >> $DEFAULT_DIR/settings.php
    #echo '}' >> $DEFAULT_DIR/settings.php

    #print "Copying local settings for site ..."

    print ''
    print '----------------------------------------------------------------------'
    print 'Entrar a:'
    print '  http://localhost:8000'

else
    print "Ya existe el directorio project/docroot."
fi
