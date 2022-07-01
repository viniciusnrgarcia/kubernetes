# Kubernetes Lab


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/namespace.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/master/manifests/metallb.yaml
kubectl apply -f https://kind.sigs.k8s.io/examples/loadbalancer/metallb-configmap.yaml
sudo ip route add 172.19.0.0/16 via $(docker inspect -f '{{range .NetworkSettings.Networks}}{{.Gateway}}{{end}}' kind-control-plane)


Tais comandos operam as seguintes funções:

Criação de namespace para gerenciamento da função loadbalancer do cluster kubernetes;
Criação do provedor de ips para os services;
Criação de config maps para provisionamento do pool de conexão para os serviços;
Adição de rota das faixas de ip informadas pelo config map.


Com estas configurações é possível realizar o deploy de um service, obter o seu ip e conectar no mesmo através da rota recentemente criada.