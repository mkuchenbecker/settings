./install.sh

sudo systemctl enable docker
sudo usermod -a -G docker $USER

echo "system needs reboot!"