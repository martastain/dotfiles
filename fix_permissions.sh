#!/bin/bash

echo **********************
echo   FIXING PERMISSIONS
echo **********************

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

find $DIR/ -type d -exec chmod 775 {} +
find $DIR/ -type f -exec chmod 664 {} +
find $DIR/.bin -type f -exec chmod 755 {} +

chmod 755 collect.sh 
chmod 755 deploy.sh
chmod 755 fix_permissions.sh 

