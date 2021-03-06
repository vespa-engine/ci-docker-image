# Copyright Verizon Media. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
FROM docker.io/vespaengine/vespa-build-centos7:latest

ENV container docker

# Fixes a problem with Rpmdb checksum cache conflicts: https://github.com/CentOS/sig-cloud-instance-images/issues/15
RUN yum install -y yum-plugin-ovl

# Install sshd, man-db, nice-to-have packages and system test dependencies
RUN yum -y clean all && \
    yum -y update && \
    sed -e '/^tsflags=/d' /etc/yum.conf > /etc/yum.conf.NEW && \
    mv /etc/yum.conf.NEW /etc/yum.conf && \
    yum -y reinstall $(rpm -q -a | grep -v vespa) && \
    yum -y --setopt=skip_missing_names_on_install=False install \
        openssh-server \
        xorg-x11-xauth \
        libxml2-devel \
        rh-ruby27-rubygems-devel \
        rh-ruby27-ruby-devel \
        rh-ruby27 \
        rh-ruby27-rubygem-net-telnet \
        nmap-ncat \
        vim \
        emacs \
        man-db \
        man-pages \
        hunspell-en && \
    yum -y --setopt=skip_missing_names_on_install=False install \
        devtoolset-10-gdb \
        devtoolset-10-libasan-devel && \
    yum -y --setopt=skip_missing_names_on_install=False install \
        kdesdk-kcachegrind \
        graphviz && \
    (source /opt/rh/devtoolset-10/enable && \
     source /opt/rh/rh-ruby27/enable && \
     gem install libxml-ruby gnuplot distribution test-unit builder concurrent-ruby ffi) && \
    yum clean all --enablerepo=\*

STOPSIGNAL SIGRTMIN+3

CMD [ "/usr/sbin/init" ]
