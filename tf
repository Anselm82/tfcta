#!/bin/bash

function console() {
  terraform console
}

function ls () {
  terraform state list
}

function enableDebug() {
    export TF_LOG_PROVIDER="DEBUG"
    export TF_LOG_PATH="terraform.log"
}

function log() {
    tail -f terraform.log | grep -o Action.*\&
}

function configure() {
    aws configure sso --profile cta
}   

function init() {
    terraform init
}

function login() {
    aws sso login --profile cta
}

function whoami() {
    aws sts get-caller-identity
}

function plan() {
   terraform plan
}

function apply() {
    terraform apply -auto-approve
}

function destroy() {
    terraform apply -destroy -auto-approve
}

case $1 in
  ls)
    ls
    ;;
  console)
    console
    ;;
  log)
    log
    ;;
  debug)
    enableDebug
    ;;
  init)
    init
    ;;
  plan)
    plan
    ;;
  configure)
    configure
    ;;
  login)
    login
    ;;
  whoami)
    whoami
    ;;
  apply)
    apply
    ;;
  destroy)
    destroy
    ;;
  *)
    echo "Nothing to do"
    ;;
esac
