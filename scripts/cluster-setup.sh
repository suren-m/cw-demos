#!/bin/bash

read -p "Enter clustername: "

aks=${REPLY:-"cw"}
print "cluster name will be $aks"
rg="$aks-rg"
print "resource group name will be $rg"
acr="$aks-acruks"
print "acr will be $acr"
nodes=3

# delete existing
# az group delete -y -n "cw-rg"

# rg
az group create --name=$rg --location=uksouth

# aks
az aks create --resource-group $rg --name $aks --node-count $nodes --node-vm-size "Standard_DS2_v2" --generate-ssh-keys

# acr
az acr create --resource-group $rg --name $acr --sku Basic

# acr access
az aks update -n $aks -g $rg --attach-acr $acr

# dashboard


# merge config
az aks get-credentials -n $aks -g $rg

kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
# access dashboard
# az aks browse -n $aks -g $rg

# kubectl config get-contexts
# kubectl config use-context cw
# kubectl create ns suren
# kubectl config set-context --current --namespace=suren
