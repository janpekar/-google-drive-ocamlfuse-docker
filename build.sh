#!/bin/bash
mkdir volumes
docker build ${http_proxy_build:-} -t google-drive-ocamlfuse . 
