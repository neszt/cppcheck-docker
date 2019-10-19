FROM alpine

MAINTAINER Neszt Tibor <tibor@neszt.hu>

RUN \
	T="$(date +%s)" && \
	apk add --no-cache -t .required_apks git make g++ pcre-dev && \
	mkdir -p /usr/src /src && cd /usr/src && \
	git clone https://github.com/danmar/cppcheck.git && \
	cd cppcheck && \
	make install FILESDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG --static" -j `getconf _NPROCESSORS_ONLN` && \
	strip /usr/bin/cppcheck && \
	apk del .required_apks && \
	rm -rf /usr/src && \
	T="$(($(date +%s)-T))" && \
	printf "Build time: %dd %02d:%02d:%02d\n" "$((T/86400))" "$((T/3600%24))" "$((T/60%60))" "$((T%60))"

ENTRYPOINT ["cppcheck", "/src"]
