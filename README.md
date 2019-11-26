```
curl https://raw.githubusercontent.com/mkuchenbecker/settings/master/bootstrap.sh -O
sudo chmod +x bootstrap.sh
./bootstrap.sh
```

https://kubecloud.io/setting-up-a-kubernetes-1-11-raspberry-pi-cluster-using-kubeadm-952bbda329c8

```
./raspi-net-setup.sh brewpi-worker7 192.168.86.107 192.168.86.1
```

```
kubectl apply -f “https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d ‘\n’)
```
