#!/bin/bash

source .env

RED='\033[0;31m'
#LIGHT_RED='\033[3;91m'
#LIGHT_MAGENTA='\033[0;95m'
GREEN='\033[3;32m'
#CIAN='\033[0;36m'
#ORANGE='\033[0;33m'
#YELLOW='\033[2;33m'
NC='\033[0m' # No Color

echo -e " "

CHECKVAR(){
  val=$1
  if [ -z ${!val} ];
  then echo -e "$RED" "Variable '$val' is not set: check ENV file" "$NC"
  exit 0
  else echo -e "$GREEN" "Variable '$val' is set:" ${!val} "$NC \n"
  fi
}

CHECKVAR "APP_PATH"
CHECKVAR "APP_NAME"

file=$PWD
echo -e "${file##*/}"
echo -e "$(dirname ${file})"

CHECKFILE() {
  val=$1
}

docker run --rm -v ~/Projects/marketplace/app-marketplace/:/app composer create-project laravel/laravel /app
sudo chown -R "$USER":"$USER" ~/Projects/marketplace/app-marketplace
