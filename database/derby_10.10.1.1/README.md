# Derby DB Docker container

Dockerfile & scripts to build a Derby DB server container

## Scripts
 - **install.sh** Install the Container
 - **start.sh** Start the Container
 - **stop.sh** Stop the Container

## Usage

Connect to Derby DB server:
- Execute client
	java -jar $DERBY_HOME/lib/derbyrun.jar ij
- Connecting to server
	CONNECT 'jdbc:derby://$ip_derby:1527/testdb;create=true';
