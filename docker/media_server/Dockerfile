FROM vercapi/debian_minion

#Prepare user
RUN mkdir -p /home/plex
RUN groupadd -r plex -g 1101 
RUN useradd -u 1101 -r -g plex -d /home/plex -s /bin/bash -c "Docker image plex user" plex
RUN chown -R plex:plex /home/plex

# Install media rpepos
RUN apt-get update && apt-get install -y curl
RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -
RUN echo "deb http://www.deb-multimedia.org wheezy main non-free" | tee -a /etc/apt/sources.list.d/deb-multimedia.list
RUN echo "deb http://shell.ninthgate.se/packages/debian wheezy main" | tee -a /etc/apt/sources.list.d/plex.list

# Install keyrings
RUN  apt-get update && apt-get install deb-multimedia-keyring -y --force-yes

# Install plex
RUN apt-get update && apt-get install plexmediaserver -y

# expose needed ports for all media server functionality
EXPOSE 1900 3005 5353 8324 32410 32412 34213 34214 32469 32400
# UDP: 1900 (for access to the Plex DLNA Server)
# TCP: 3005 (for controlling Plex Home Theater via Plex Companion)
# UDP: 5353 (for older Bonjour/Avahi network discovery)
# TCP: 8324 (for controlling Plex for Roku via Plex Companion)
# UDP: 32410, 32412, 32413, 32414 (for current GDM network discovery)
# TCP: 32469 (for access to the Plex DLNA Server)
# TCP: 32400 for web access

VOLUME ['/home/plex/Library/', '/movies', '/music' '/pictures']

# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor

# Shel script to run plex
COPY plex_start.sh /home/plex/plex_start.sh
RUN chown plex /home/plex/plex_start.sh
RUN chmod u+x /home/plex/plex_start.sh

# Run supervisord
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
