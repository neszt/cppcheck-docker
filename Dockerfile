FROM alpine

MAINTAINER Neszt Tibor <tibor@neszt.hu>

RUN apk add --no-cache -t .required_apks make g++ curl pcre-dev && \
	mkdir -p /usr/src /src && cd /usr/src && \
	curl -L https://github.com/danmar/cppcheck/archive/master.tar.gz | tar zx && \
	cd cppcheck-master && \
	sed -i 's/\(    CXXFLAGS.*\)$/\1 --static -DNO_UNIX_SIGNAL_HANDLING/' Makefile && \
	make install CFGDIR=/cfg HAVE_RULES=yes -j `getconf _NPROCESSORS_ONLN` && \
	strip /usr/bin/cppcheck && \
	apk del .required_apks && \
	rm -rf /usr/src

ENTRYPOINT ["cppcheck", "/src"]
