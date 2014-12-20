# MongoDB Docker Container
Dockerfile & scripts to build a MongoDB server container

## Components
 - Fedora 21
 - MongoDB 2.4.9-8

## Scripts
 - **install.sh** Install the Container
 - **start.sh** Start the Container
 - **stop.sh** Stop the Container

## Usage

Connect to MongoDB server

	mongo --host {server_ip} --port 27017

Connecting to server
	
	http://{server_ip}:28017/

Note: You will need to adjust the port numbers to the correctly mapped ports.
