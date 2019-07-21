sudo apt-get install vim
sudo apt-get install git

sudo add-apt-repository -y ppa:longsleep/golang-backports \
&& sudo apt-get update \
&& sudo apt-get install golang-go

sudo apt-get install go-dep


sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
&& sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" \
&& sudo apt-get update \
&& sudo apt-get install docker-ce docker-ce-cli containerd.io

