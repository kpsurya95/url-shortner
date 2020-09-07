FROM ubuntu:latest

MAINTAINER "Sivaganesh Panditi <ganesh0479@gmail.com>"

RUN wget "https://api.adoptopenjdk.net/v3/binary/latest/14/ga/linux/x64/jdk/hotspot/normal/adoptopenjdk?project=jdk" -O /tmp/OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz
RUN tar xzf /tmp/OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz -C /opt/
RUN ln -s /opt/jdk-14.0.2+12 /opt/JDK_14
RUN rm -f /tmp/OpenJDK14U-jdk_x64_linux_hotspot_14.0.2_12.tar.gz
ENV JAVA_HOME /opt/JDK_14/bin

### maven : begin

RUN wget --no-verbose -O /tmp/apache-maven-3.3.0.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.0/binaries/apache-maven-3.3.0-bin.tar.gz
RUN tar xzf /tmp/apache-maven-3.3.0.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.3.0 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.3.0.tar.gz
ENV MAVEN_HOME /opt/maven

### maven : end

# set the path of the working dir
RUN mkdir /usr/src/url-shortner
WORKDIR /usr/src/url-shortner

# clone the repository with the code
RUN git clone -b master git://github.com/ganesh0479/sample-doc.git

# install npm modules
WORKDIR /usr/src/url-shortner/sample-doc/url-shortner
RUN mvn generate-resources install
RUN chmod 777 /tmp

RUN yes | cp -rf /usr/src/url-shortner/sample-doc/url-shortner/target/url-shortner-0.0.1-SNAPSHOT.jar /usr/src/url-shortner

CMD ["java", "-jar", "/usr/src/url-shortner/url-shortner-0.0.1-SNAPSHOT.jar"]

####
# build with:
# docker build -t javaee/sample-doc/url-shortner .
#
# run with:
# docker run --rm -it -p 80:8080  javaee/sample-doc/url-shortner