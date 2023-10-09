FROM mcr.microsoft.com/devcontainers/universal:2-linux

ENV TOOLS_HOME=/usr/local
WORKDIR ${TOOLS_HOME}

############################################################
########################## LINUX ###########################
############################################################

RUN apt update \
  && apt install -y cmake libgtk-3-dev ninja-build

############################################################
######################### ANDROID ##########################
############################################################

ENV ANDROID_HOME=$TOOLS_HOME/androidsdk
ENV PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"

ARG _file_name="commandlinetools-linux-8092744_latest.zip"
# Install Android SDK Manager and Android 31
RUN wget "https://dl.google.com/android/repository/$_file_name" \
  && unzip "$_file_name" -d $ANDROID_HOME \
  && rm -f "$_file_name" \
  && mkdir -p $ANDROID_HOME/cmdline-tools/latest \
  && mv $ANDROID_HOME/cmdline-tools/bin $ANDROID_HOME/cmdline-tools/latest \
  && mv $ANDROID_HOME/cmdline-tools/lib $ANDROID_HOME/cmdline-tools/latest \
  && yes | sdkmanager "platform-tools" "build-tools;31.0.0" "platforms;android-31"

############################################################
############################ WEB ###########################
############################################################

# Install Google Chrome
RUN apt install -y apt-transport-https \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt update \
  && apt install -y google-chrome-stable

# Install Microsoft Edge
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
  && install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ \
  && sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list' \
  && rm microsoft.gpg \
  && apt update \
  && apt install microsoft-edge-dev

############################################################
######################### FLUTTER ##########################
############################################################

ENV FLUTTER_HOME=$TOOLS_HOME/flutter
ENV FLUTTER_VERSION=3.13.5

RUN git clone https://github.com/flutter/flutter -b $FLUTTER_VERSION $FLUTTER_HOME
RUN git config --global --add safe.directory $FLUTTER_HOME
# Give permissions of read/writing to all users on Flutter dir
RUN chmod -R 777 $FLUTTER_HOME

ENV PATH="$FLUTTER_HOME/bin:$PATH"
ENV PUB_CACHE=$FLUTTER_HOME/.pub_cache

# Enable Flutter Web, Android and Linux Desktop
# Also doing precache, to increase workspace init
RUN flutter precache && for _plat in web linux-desktop; do flutter config --enable-${_plat}; done \
  && flutter config --android-sdk $ANDROID_HOME \
  && yes | flutter doctor --android-licenses \
  && flutter doctor
