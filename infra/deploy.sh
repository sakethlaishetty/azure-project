#!/bin/bash

# ================================
# Azure Deployment Script
# ================================

# Variables
RESOURCE_GROUP="azure-proj-rg"
LOCATION="eastus"
APP_PLAN="azure-proj-plan"
WEBAPP="saketh-azure-proj"
SQL_SERVER="saketh-sqlserver"
SQL_DB="azureprojdb"
STORAGE="sakethstorageacct"

echo ">>> Creating Resource Group"
az group create --name $RESOURCE_GROUP --location $LOCATION

echo ">>> Creating App Service Plan (Free Tier if available)"
az appservice plan create --name $APP_PLAN --resource-group $RESOURCE_GROUP --sku F1 --is-linux

echo ">>> Creating Web App"
az webapp create --resource-group $RESOURCE_GROUP --plan $APP_PLAN --name $WEBAPP --runtime "PYTHON:3.9"

echo ">>> Creating SQL Server and Database"
az sql server create --name $SQL_SERVER --resource-group $RESOURCE_GROUP --location $LOCATION --admin-user azureadmin --admin-password "StrongPassword123!"
az sql db create --resource-group $RESOURCE_GROUP --server $SQL_SERVER --name $SQL_DB --service-objective S0

echo ">>> Creating Storage Account"
az storage account create --name $STORAGE --resource-group $RESOURCE_GROUP --location $LOCATION --sku Standard_LRS

echo ">>> Deployment Completed!"
