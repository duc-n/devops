#!/bin/bash

cd shopfront
mvn clean install
if docker build -t celeduc/shopfront:1.0 . ; then
  docker push celeduc/shopfront:1.0
fi
cd ..

cd productcatalogue
mvn clean install
if docker build -t celeduc/productcatalogue:1.0 . ; then
  docker push celeduc/productcatalogue:1.0
fi
cd ..

cd stockmanager
mvn clean install
if docker build -t celeduc/stockmanager:1.0 . ; then
  docker push celeduc/stockmanager:1.0
fi
cd ..
