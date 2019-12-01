#!/bin/bash 
# Setup, v0.0.3

flynt="1.1.1"
current=$PWD
themes="../wp-content/themes"
vhost=`cat ../../.docksal/docksal.env | grep '#VIRTUAL_HOST' | cut -f 2 -d '='`
green="\e[92m"
blue="\e[36m"
white="\e[97m"

resetColor () {
  echo -e "${white}"
}

echo -e "${blue}Install ACF-pro." &&
resetColor &&
wp plugin install --allow-root --activate --force advanced-custom-fields-pro.zip &&
echo -e "${blue}Install Flynt" &&
resetColor &&
# Move into the themes directory
echo "cd $themes" &&
cd $themes &&
echo "rm -Rfv flynt/" &&
rm -Rfv flynt/ &&
wget "https://github.com/flyntwp/flynt/archive/v${flynt}.zip" &&
unzip "v${flynt}.zip" &&
rm "v${flynt}.zip" &&
mv "flynt-${flynt}" flynt &&
cd "flynt/" &&
echo -e "${blue}Install composer" &&
resetColor &&
composer install &&
wp theme activate --allow-root flynt &&
echo -e "${blue}Install node modules"
resetColor
echo "npm install"
npm install &&
echo -e "${blue}Update flynt host file" &&
resetColor &&
echo "sed -i 's/flynt-components.local.blee.ch/$vhost/g'"
sed -i "s/flynt-components.local.blee.ch/$vhost/g" build-config.js &&
echo -e "${green}DONE!" &&
resetColor &&
printf '\n'
