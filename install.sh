sudo apt-get install vim
sudo apt-get install git

sudo add-apt-repository -y ppa:longsleep/golang-backports &&
    sudo apt-get update &&
    sudo apt-get install golang-go

sudo apt-get install go-dep

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common &&
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" &&
    sudo apt-get update &&
    sudo apt-get install docker-ce docker-ce-cli containerd.io

# Make sure you grab the latest version
curl -OL https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip

# Unzip
unzip protoc-3.5.1-linux-x86_64.zip -d protoc3

# Move protoc to /usr/local/bin/
sudo mv protoc3/bin/* /usr/local/bin/

# Move protoc3/include to /usr/local/include/
sudo mv protoc3/include/* /usr/local/include/

# Optional: change owner
sudo chown $USER /usr/local/bin/protoc
sudo chown -R $USER /usr/local/include/google

go get -d -u github.com/golang/protobuf/protoc-gen-go &&
    go install github.com/golang/protobuf/protoc-gen-go

go get github.com/golang/mock/gomock &&
    go install github.com/golang/mock/mockgen

sudo apt-get install python3-pip
