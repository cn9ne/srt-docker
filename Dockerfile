FROM registry.access.redhat.com/ubi9/openjdk-17@sha256:a1861cf5eeac4486027c99ce62c1d98c29675c50c7928db8407928abe5fcafca
USER root
RUN microdnf -y update; \
    microdnf -y install python3.12; \
    microdnf -y install python3.12-pip; \
    microdnf -y  install gzip; \
    microdnf -y  install openssh-clients; \
    microdnf -y  install iputils; \
    microdnf -y  install zip; \
    microdnf -y  install unzip; \
    microdnf -y  install net-tools; \
    microdnf -y  install wget ; \
    microdnf -y  install procps; \
    microdnf clean all; \
    mkdir -p /home/default/.local/lib/python3.12/site-packages; \
    mkdir -p /home/default/.local/lib/python3.9/site-packages; \
    chown -R 185:8899 /home/default/.local; \
    chmod -R g=u /home/default/.local; \
    chown -R 185:8899 /opt/jboss; \
    chown -R 185:8899 /usr/local/s2i; \
    chown -R 185:8899 /home/default; \
    chown -R 0:8899 /etc/passwd;
USER 185
ENV PATH="/home/default/.local/bin:${PATH}"
ENV PYTHONUSERBASE="/home/default/.local"
RUN pip3.12 install --upgrade pip; \
    pip3.12 install --user numpy pandas psycopg2-binary sqlalchemy;