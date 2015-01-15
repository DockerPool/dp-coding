FROM sshd:dwj
# Any other ubuntu:14.04 image is OK.

MAINTAINER waitfish from dockerpool.com(dwj_zz@163.com)

#Install Pillow External libraries.
RUN \
  apt-get update && \
  apt-get install -y python-pip build-essential gcc unzip vim python-dev && \
  apt-get install -y libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk && \
  apt-get install -y git && \
  pip install pymongo tornado redis eventlet sqlalchemy markdown pillow wtforms && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ADD smtp.py /smtp.py



# Add run scripts
ADD run.sh /run.sh
ADD install_tornadomail.sh /install_tornadomail.sh
RUN chmod 755 ./*.sh


#Add tornadomail by handle
RUN bash /install_tornadomail.sh


VOLUME /dockerpool

EXPOSE 3003
EXPOSE 22

CMD ["/run.sh"]
