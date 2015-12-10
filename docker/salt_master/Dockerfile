FROM debian:jessie

# Update repositories
RUN apt-get update && apt-get install -y wget
RUN wget -O - https://repo.saltstack.com/apt/debian/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/debian/latest jessie main >> /etc/apt/sources.list

#Volumes for persistent data
VOLUME ['/etc/salt/pki', '/var/cache/salt', '/var/logs/salt', '/etc/salt/master.d', '/srv/salt', '/srv/pillar']

# /etc/salt/pki      - This holds the Salt Minion authentication keys
# /var/cache/salt    - Job and Minion data cache
# /var/logs/salt     - Salts log directory
# /etc/salt/master.d - Master configuration include directory
# /srv/salt          - Holds your states, pillars etc

# Install salt master
RUN apt-get update && apt-get install -y salt-master

# Write master cong
COPY master /etc/salt/master

# Configure ports for salt
EXPOSE 4505 4506

# Install and configure sshd
RUN apt-get install -y openssh-server supervisor
RUN mkdir -p /var/run/sshd
#get the password
COPY pwdfile /etc/pwdfile 
RUN echo root:`cat /etc/pwdfile` | chpasswd
#remove the password
RUN rm /etc/pwdfile 
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# Expose the ssh port
EXPOSE 22

# Install supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor

# Run supervisor
CMD ["/usr/bin/supervisord"]
