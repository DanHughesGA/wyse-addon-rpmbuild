FROM centos:7
MAINTAINER "Daniel Hughes" <dan.hughes@gatwickairport.com>
RUN yum clean metadata \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install rpm-build tito mock git rpmdevtools squashfs-tools tar make yum-utils \
    && yum -y update \
    && yum clean all \
    && package-cleanup --oldkernels --count=1 \
    && rm -rf /var/cache/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/info/*

COPY 11_3_rpm-to-squashrpm /usr/bin
COPY SuSE-release /etc
RUN chmod +x /usr/bin/11_3_rpm-to-squashrpm

CMD ["/bin/bash"]
