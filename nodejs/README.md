docker run --name kubia-container -p 8080:8080 -d kubia

kubectl scale rc kubia --replicas=3
kubectl get rc
kubectl delete rc kubia
kubectl get pods
kubectl get pods -o wide
kubectl describe pod kubia-7wkm6


------
kubectl create -f kubia-manual.yaml
kubectl get po kubia-manual -o yaml
kubectl logs kubia-manual

kubectl delete po kubia-s6t4h
kubectl port-forward kubia-manual 8888:8080



-------- external port tuto:
kubectl run nginx --image=nginx --port=80 --replicas=3
kubectl expose deployment nginx --type NodePort
kubectl get po -o wide
kubectl get svc nginx
kubectl patch svc nginx --patch '{"spec": {"externalIPs": ["10.22.0.0"]}}'
sudo ip a a 10.22.0.0 dev lo

kubectl run nginx --image=nginx --port=8888
kubectl expose deployment nginx --type NodePort

kubectl delete svc nginx
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.2.1/manifests/metallb.yaml
kubectl get po -n metallb-system

vagrant ssh k8s-head -c "ip addr show eth1 | grep link/ether"
vagrant ssh k8s-node-1 -c "ip addr show eth1 | grep link/ether"
sudo vi /etc/systemd/system/kubelet.service.d/10-kubeadm.conf

kubectl get nodes k8s-head -o yaml

kubectl get nodes worker1 -o yaml

kubectl --server=https://127.0.0.1:6443 --certificate-authority=/etc/kubernetes/ssl/ca.crt --client-certificate=/etc/kubernetes/ssl/kubectl.crt --client-key=/etc/kubernetes/ssl/kubectl.key get node