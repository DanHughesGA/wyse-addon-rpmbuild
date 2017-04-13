FROM centos:7
MAINTAINER "Daniel Hughes" <dan.hughess@gatwickairport.com>
RUN yum clean metadata \
    && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
    && yum -y install rpm-build tito mock git rpmdevtools squahsfs-tools tar make yum-utils \
    && yum -y update \
    && yum clean all \
    && package-cleanup --oldkernels --count=1 \
    && rm -rf /var/cache/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /usr/share/man/* \
    && rm -rf /usr/share/info/*

RUN adduser \
    --comment "RPM Builder" \
    --home /home/rpmbuild \
    --create-home \
    rpmbuild

USER rpmbuild
WORKDIR /home/rpmbuild

CMD ["/bin/bash"]
