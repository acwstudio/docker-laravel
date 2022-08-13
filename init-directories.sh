#!/bin/bash

source .env

RED='\033[0;31m'
#LIGHT_RED='\033[3;91m'
#LIGHT_MAGENTA='\033[0;95m'
GREEN='\033[3;32m'
CIAN='\033[1;36m'
#ORANGE='\033[0;33m'
YELLOW='\033[3;33m'
NC='\033[0m' # No Color

PROJECTS_DIR="Projects"

echo -e "$CIAN ------> The 'init-directories' script starts $NC"

if [ ! -d $HOME/$PROJECTS_DIR/ ]; then
  mkdir $HOME/$PROJECTS_DIR/
  echo -e "$GREEN Directory '$HOME/$PROJECTS_DIR/' was created $NC"
  else echo -e "$YELLOW Directory '$HOME/$PROJECTS_DIR/' already exists $NC"
fi

if [ ! -d $HOME/$PROJECTS_DIR/"$APP_NAME" ]; then
  mkdir $HOME/$PROJECTS_DIR/"$APP_NAME"
  echo -e "$GREEN Directory '$HOME/$PROJECTS_DIR/$APP_NAME' was created $NC"
  else echo -e "$YELLOW Directory '$HOME/$PROJECTS_DIR/$APP_NAME' already exists $NC"
fi

if [ ! -d $HOME/$PROJECTS_DIR/"$APP_NAME"/app-"$APP_NAME" ]; then
  mkdir $HOME/$PROJECTS_DIR/"$APP_NAME"/app-"$APP_NAME"
  echo -e "$GREEN Directory '$HOME/$PROJECTS_DIR/$APP_NAME/app-$APP_NAME' was created $NC"
  else echo -e "$YELLOW Directory '$HOME/$PROJECTS_DIR/$APP_NAME/app-$APP_NAME' already exists $NC"
fi

if [ ! -d $HOME/$PROJECTS_DIR/"$APP_NAME"/docker-"$APP_NAME" ]; then
  mkdir $HOME/$PROJECTS_DIR/"$APP_NAME"/docker-"$APP_NAME"
  echo -e "$GREEN Directory '$HOME/$PROJECTS_DIR/$APP_NAME/docker-$APP_NAME' was created $NC"
  else echo -e "$YELLOW Directory '$HOME/$PROJECTS_DIR/$APP_NAME/docker-$APP_NAME' already exists $NC"
fi