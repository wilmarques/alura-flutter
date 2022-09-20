FROM gitpod/workspace-full-vnc
############################ WEB ###########################
############################################################

# Install Google Chrome
USER root
RUN apt-get update \
  && apt-get install -y apt-transport-https \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update \
  && sudo apt-get install -y google-chrome-stable

############################################################
######################### FLUTTER ##########################
############################################################

USER gitpod
WORKDIR /home/gitpod

ENV FLUTTER_VERSION=3.0.5
RUN git clone https://github.com/flutter/flutter -b ${FLUTTER_VERSION} --depth=1

ENV PATH="$HOME/flutter/bin:$PATH"
ENV PUB_CACHE="/workspace/.pub_cache"

# Enable Flutter Web, Android and Linux Desktop
# Also doing precache, to increase workspace init
RUN flutter precache && for _plat in web; do flutter config --enable-${_plat}; done \
  && flutter doctor

############################################################
########################### MISC ###########################
############################################################

# For Qt WebEngine on docker
ENV QTWEBENGINE_DISABLE_SANDBOX 1
