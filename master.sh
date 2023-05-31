#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.0.51
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh