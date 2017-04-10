FROM node:onbuild

ONBUILD COPY getconfig.sh /etc/init.d
ONBUILD RUN ln -s /etc/init.d/getconf.sh /etc/rc3.d/S03getconf.sh 

EXPOSE 8000
