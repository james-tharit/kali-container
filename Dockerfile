# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

USER root  
# Set working directory to /root
WORKDIR /root

# HOT FIX: ignore certificates
RUN touch /etc/apt/apt.conf.d/99verify-peer.conf \
	&& echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

RUN echo >>/etc/apt/sources.list "deb http://http.kali.org/kali kali-rolling main contrib non-free"
# HOT FIX: make sure apt update is working
RUN apt update -y

# HOT FIX: Install ca-certificates & remove 99verify-peer.conf
RUN apt install ca-certificates -y && rm -rf /etc/apt/apt.conf.d/99verify-peer.conf

# Update & Clean Up
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y && apt autoremove -y && apt clean

# Install common and useful tools
RUN apt install -y curl git vim nmap ncat iputils-ping john

RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev

RUN apt install python3 -y

# # Install Tor and proxychains, then configure proxychains with Tor
RUN apt -y install proxychains tor
COPY config/proxychains.conf /etc/proxychains.conf

# Install ZSH shell with custom settings and set it as default shell
RUN apt install zsh -y
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.zshrc .

# Install zsh-autosucggestions
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

ENTRYPOINT ["/bin/zsh"]
