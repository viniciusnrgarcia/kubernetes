1- get IP Range using: docker network inspect -f '{{.IPAM.Config}}' kind

2- Create configmap and apply


apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: config
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.19.255.200-172.19.255.250 # IP RETORNADO NO COMANDO ANTERIOR


kubectl apply -f configmap-create.yaml


