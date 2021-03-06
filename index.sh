#!/usr/bin/env bash

REMOTE_PORT=2200
LOCAL_PORT=22
IDENTITY=""

while [ "$1" != "" ]; do
  case "$1" in
    --local-port)  LOCAL_PORT="$2"; shift; shift;;
    -l)            LOCAL_PORT="$2"; shift; shift;;
    --remote-port) REMOTE_PORT="$2"; shift; shift;;
    -r)            REMOTE_PORT="$2"; shift; shift ;;
    --identity)    IDENTITY="-i $2"; shift; shift ;;
    -i)            IDENTITY="-i $2"; shift; shift ;;
    --*)           shift; shift ;;
    *)             REMOTE="$1"; shift ;;
  esac
done

if [ "$REMOTE" == "" ]; then
  echo "Usage: ssh-remote-forward user@host [options]"
  echo
  echo "  --remote-port, -r  [defaults to 2200]"
  echo "  --local-port,  -l  [defaults to 22]"
  echo "  --identity,    -i  [set non default ssh identity]"
  echo
  exit 1
fi

ssh $IDENTITY -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o ServerAliveInterval=300 -o ServerAliveCountMax=2 -N -R "$REMOTE_PORT:localhost:$LOCAL_PORT" "$REMOTE"
