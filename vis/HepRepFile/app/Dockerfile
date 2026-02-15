# System.runFinalizersOnExit() used in HepRApp is removed in Java 8 update 402
# but still works in Java 8 update 312, a "Long Term Support" milestone
FROM openjdk:8u312-jre-slim-buster

# use archive mirror to avoid connection issues for old versions of Debian
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/stretch-updates/d' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list

# install dependencies
RUN apt-get update && apt-get install -y libxext6 libxrender1 libxtst6 libxi6 libfreetype6 fontconfig wget && \
    rm -rf /var/lib/apt/lists/* 
    
# copy user properties to /
COPY user.properties user.properties

# download HepRApp from GEARS GitHub release
RUN wget https://github.com/jintonic/gears/releases/download/v1.5.1/HepRApp.jar

CMD ["java", "-jar", "HepRApp.jar"]
