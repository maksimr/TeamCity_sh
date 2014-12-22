#!/bin/bash

source "lib/require.bash"
require http

http_request 'https://www.jetbrains.com/teamcity/whatsnew/'
