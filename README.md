# Entorno de desarrollo para Condo


Para utilizar este entorno asegurarse de tener docker instalado.

La primera vez se debe ejecutar los siguientes comandos:


        $ . env.sh
        $ d4d clean
        $ d4d build
        $ ./build-site.sh

Estos comandos generan las imagenes de docker y configuran un sitio de condo para arrancar. Para terminar la primera vez hay que correr el install.php para instalar el perfil de instalación de Condo:

*  http://localhost:8000/install.php

Cada vez que se quiera trabajar hay que ejecutar:

        $ . env
        $ d4d up

El código está en el siguiente directorio:

* app/docroot/profiles/condo/