#!/bin/bash
sed "s/tagVersion/$1/g" angular-app.yaml > angular-deployment.yaml
