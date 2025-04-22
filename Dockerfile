FROM nextcloud:latest

# Install dependencies for building dlib from source
RUN apt update \
  && apt install -y wget gnupg2 unzip git cmake build-essential \
  libavdevice-dev libavfilter-dev libavformat-dev libavcodec-dev \
  libswresample-dev libswscale-dev libavutil-dev libjxl-dev \
  libopenblas-dev liblapack-dev libx11-dev

# Build and install dlib from source
RUN git clone https://github.com/davisking/dlib.git \
  && cd dlib/dlib \
  && mkdir build \
  && cd build \
  && cmake -DBUILD_SHARED_LIBS=ON .. \
  && make \
  && make install \
  && cd / \
  && rm -rf dlib

# Install pdlib extension
RUN wget https://github.com/goodspb/pdlib/archive/master.zip \
  && mkdir -p /usr/src/php/ext/ \
  && unzip -d /usr/src/php/ext/ master.zip \
  && rm master.zip
RUN docker-php-ext-install pdlib-master

# Install bz2 to uncompress models
RUN apt install -y libbz2-dev ffmpeg
RUN docker-php-ext-install bz2

# Increase memory limits
RUN echo memory_limit=1024M > /usr/local/etc/php/conf.d/memory-limit.ini

# These last lines are just for testing the extension.. You can delete them.
RUN wget https://github.com/matiasdelellis/pdlib-min-test-suite/archive/master.zip \
  && unzip -d /tmp/ master.zip \
  && rm master.zip
RUN cd /tmp/pdlib-min-test-suite-master \
    && make