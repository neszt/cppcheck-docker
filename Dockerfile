FROM alpine

MAINTAINER Neszt Tibor <tibor@neszt.hu>

RUN apk add --no-cache -t .requred_apks make g++ curl pcre-dev && \
	mkdir -p /usr/src /src && cd /usr/src && \
	curl -L https://github.com/danmar/cppcheck/archive/master.tar.gz | tar zx && \
	cd cppcheck-master && \
	sed -i 's/\(    CXXFLAGS.*\)$/\1 --static -DNO_UNIX_SIGNAL_HANDLING/' Makefile && \
	make install CFGDIR=/cfg HAVE_RULES=yes && \
	strip /usr/bin/cppcheck && \
	apk del .requred_apks && \
	rm -rf /usr/src

ENTRYPOINT ["cppcheck", "/src"]
