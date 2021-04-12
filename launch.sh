#!/bin/sh
echo "Waiting 3 seconds for deployer interrupt ..."
sleep 3

echo "Looking for CONFIG_URL to download the config"
if [ ! -z $CONFIG_URL ]
then
  echo "Found config url and downloading to sandbox"
  mkdir -p /sandbox
  git clone $CONFIG_URL /sandbox
else
  echo "No config url supplied"
fi

echo "Starting ..."
gunicorn --bind 0.0.0.0:3000 wsgi:app
