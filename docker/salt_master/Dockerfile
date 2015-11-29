FROM debian:jessie

# Update repositories
RUN apt-get update && apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/debian/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/debian/latest jessie main >> /etc/apt/sources.list

#Volumes for persistent data
VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt']

# /etc/salt/pki      - This holds the Salt Minion authentication keys
# /var/cache/salt    - Job and Minion data cache
# /var/logs/salt     - Salts log directory
# /etc/salt/master.d - Master configuration include directory
# /srv/salt          - Holds your states, pillars etc

# Install salt master
RUN apt-get update && apt-get install -y salt-master

# Configure ports
EXPOSE 4505 4506

CMD salt-master
