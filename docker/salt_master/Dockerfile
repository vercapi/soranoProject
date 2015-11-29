FROM debian:jessie

# Update repositories
RUN apt-get update && apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/debian/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/debian/latest jessie main >> /etc/apt/sources.list

# Install salt master
RUN apt-get update && apt-get install -y salt-master

# Configure ports
EXPOSE 4505 4506

CMD salt-master
