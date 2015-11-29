FROM debian:jessie
RUN apt-get update && apt-get install -y wget

# Add correct repository and its key
RUN wget -O - https://repo.saltstack.com/apt/debian/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
RUN echo deb http://repo.saltstack.com/apt/debian/latest jessie main >> /etc/apt/sources.list

# Install and configure salt minion
RUN apt-get update && apt-get install -y salt-minion
ADD ./minion /etc/salt/minion

# Run the Salt Minion and do not detach from the terminal.
# This is important because the Docker container will exit whenever
# the CMD process exits.
CMD /bin/sh