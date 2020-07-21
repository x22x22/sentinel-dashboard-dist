#!/bin/bash

SERVER_HOSTNAME=${SERVER_HOSTNAME:-localhost}
SERVER_PORT=${SERVER_PORT:-8080}
PROJECT_NAME=${PROJECT_NAME:-sentinel-dashboard}
AUTH_ENABLED=${AUTH_ENABLED:-false}
AUTH_USERNAME=${AUTH_USERNAME:-sentinel}
AUTH_PASSWORD=${AUTH_PASSWORD:-123456}

java ${BEFORE_ARGS} \
  -Dserver.port=${SERVER_PORT} \
  -Dcsp.sentinel.dashboard.server=${SERVER_HOSTNAME}:${SERVER_PORT} \
  -Dproject.name=${PROJECT_NAME} \
  -Dauth.enabled=${AUTH_ENABLED} \
  -Dsentinel.dashboard.auth.username=${AUTH_USERNAME} \
  -Dsentinel.dashboard.auth.password=${AUTH_PASSWORD} \
  -jar /app/sentinel-dashboard.jar \
  ${AFTER_ARGS}
