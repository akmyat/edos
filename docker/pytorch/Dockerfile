FROM nvidia/cuda:11.7.0-cudnn8-runtime-ubuntu20.04 

# Create the user
ARG USERNAME
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Setup SSH server
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openssh-server

RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh 
RUN mkdir /home/$USERNAME/.ssh/

COPY user_ed25519.pub /root/.ssh/authorized_keys
COPY user_ed25519.pub /home/$USERNAME/.ssh/authorized_keys

RUN chown -R root /root
RUN chown -R $USERNAME /home/$USERNAME/.ssh

# set the locale to en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y locales
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen en_US.UTF-8 \
    && dpkg-reconfigure locales \
    && /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# install libraries
RUN apt-get install -y python3-pip neovim
RUN apt-get install -y libcairo-dev pkg-config
RUN pip3 install numpy \
    matplotlib \
    pandas \
    scikit-learn \
    jupyter \
    torch \
    torchvision \
    torchaudio \
    transformers \
    pycairo

# Run SSH server
CMD /usr/sbin/sshd -D
EXPOSE 22