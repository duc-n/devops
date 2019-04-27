#!/bin/bash

cd shopfront
mvn clean install
if docker build -t celeduc/shopfront . ; then
  docker push celeduc/shopfront
fi
cd ..

cd productcatalogue
mvn clean install
if docker build -t celeduc/productcatalogue . ; then
  docker push celeduc/productcatalogue
fi
cd ..

cd stockmanager
mvn clean install
if docker build -t celeduc/stockmanager . ; then
  docker push celeduc/stockmanager
fi
cd ..
