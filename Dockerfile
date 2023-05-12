# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# HOT FIX: ignore certificates
RUN touch /etc/apt/apt.conf.d/99verify-peer.conf \
&& echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

# HOT FIX: make sure apt update is working
RUN apt -y update 

# HOT FIX: Install ca-certificates & remove 99verify-peer.conf
RUN apt -y install ca-certificates && rm -rf /etc/apt/apt.conf.d/99verify-peer.conf

# Update
RUN apt -y update && DEBIAN_FRONTEND=noninteractive apt -y dist-upgrade && apt -y autoremove && apt clean

# Install common and useful tools
RUN apt -y install curl wget vim git iproute2 whois netcat-openbsd pciutils usbutils iputils-ping

# # Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools
# RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar ltrace strace binwalk

# # Install Tor and proxychains, then configure proxychains with Tor
# RUN apt -y install tor proxychains
# COPY config/proxychains.conf /etc/proxychains.conf

# # Install ZSH shell with custom settings and set it as default shell
RUN apt -y install zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.zshrc .

ENTRYPOINT ["/bin/zsh"]