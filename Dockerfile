# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# HOT FIX: ignore certificates
RUN touch /etc/apt/apt.conf.d/99verify-peer.conf \
	&& echo >>/etc/apt/apt.conf.d/99verify-peer.conf "Acquire { https::Verify-Peer false }"

# HOT FIX: make sure apt update is working
RUN apt update -y

# HOT FIX: Install ca-certificates & remove 99verify-peer.conf
RUN apt install ca-certificates -y && rm -rf /etc/apt/apt.conf.d/99verify-peer.conf

# Update
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y && apt autoremove -y && apt clean

# Install common and useful tools
RUN apt install curl wget iproute2 whois pciutils usbutils iputils-ping vim git dnsutils net-tools steghide procps tor -y

RUN apt install nmap ncat telnet man putty-tools -y
# # Install Kali Linux "Top 10" metapackage and a few cybersecurity useful tools
# RUN DEBIAN_FRONTEND=noninteractive apt -y install kali-tools-top10 exploitdb man-db dirb nikto wpscan uniscan lsof apktool dex2jar ltrace strace binwalk
RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
	chmod 755 msfinstall && \
	./msfinstall
# # Install Tor and proxychains, then configure proxychains with Tor
RUN apt -y install proxychains
COPY config/proxychains.conf /etc/proxychains.conf

# # Install ZSH shell with custom settings and set it as default shell
RUN apt install zsh -y
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY config/.zshrc .

ENTRYPOINT ["/bin/zsh"]
