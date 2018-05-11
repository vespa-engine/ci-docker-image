# Copyright 2017 Yahoo Holdings. Licensed under the terms of the Apache 2.0 license. See LICENSE in the project root.
FROM centos:7

# Needed to build vespa
RUN yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/g/vespa/vespa/repo/epel-7/group_vespa-vespa-epel-7.repo && \
    yum -y install epel-release && \
    yum -y install centos-release-scl && \
    yum -y --enablerepo=epel-testing install \
        ccache \
        cmake3 \
        devtoolset-7-binutils \
        devtoolset-7-gcc-c++ \
        devtoolset-7-libatomic-devel \
        flex \
        bison \
        git \
        java-1.8.0-openjdk-devel \
        Judy-devel \
        libicu-devel \
        libzstd-devel \
        llvm3.9-devel \
        llvm3.9-static \
        lz4-devel \
        make \
        rh-maven33 \
        openssl \
        openssl-devel \
        perl \
        perl-Data-Dumper \
        perl-Env \
        perl-IO-Socket-IP \
        perl-JSON \
        perl-libwww-perl \
        perl-Net-INET6Glue \
        perl-URI \
        rpm-build \
        sudo \
        valgrind \
        'vespa-boost-devel >= 1.59.0-7' \
        'vespa-cppunit-devel >= 1.12.1-7' \
        'vespa-gtest >= 1.8.0-1' \
        zlib-devel && \
    yum clean all && \
    echo "source /opt/rh/devtoolset-7/enable" >> /etc/profile.d/devtoolset-7.sh && \
    echo "source /opt/rh/rh-maven33/enable" >> /etc/profile.d/devtoolset-7.sh && \
    echo "*          soft    nproc     32768" > /etc/security/limits.d/90-nproc.conf

# Java requires proper locale for unicode
ENV LANG en_US.UTF-8
