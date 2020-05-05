ARG version=latest
FROM ubuntu:$version
MAINTAINER JCD "jcd717@outlook.com"

# metadonnee ajoutee à l'image,(accessible par INSPECT)
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"


RUN useradd user1
USER user1
# COPY = copie de ... (ex:COPY fichier)
# ADD = copie du contenu de (ex: ADD http://// ou ADD fichier.tar)

COPY --chown=user1:user1 heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh;

#ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information de port réseau utile,(accessible par INSPECT)
EXPOSE 1234/udp 4321/tcp

#dans Ubuntu, à priori l'entrypoint est bash(par défaut), donc on le modifie pour lancer notre script hearbeat
ENTRYPOINT ["/entrypoint.sh"]
#CMD = paramètres du script entrypoint
CMD ["battement"]
#autre façon de faire : pas d'ENTRYPOINT, que CMD [script, param...]
#CMD ["/entrypoint.sh","battement"]

#docker build --build-arg VAR=valeur
