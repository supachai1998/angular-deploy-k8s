# helm setup

# install helm ปกติทั่วไปตาม docs https://kubernetes.github.io/ingress-nginx/deploy/
apt install -y curl
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# ตั้งค่าให้ helm ใช้ namespace and 
# เปลี่ยน namespace ได้ตามต้องการ ถ้าไม่มีก็ create ใหม่
# kubectl create namespace and
helm upgrade --install ingress1 ingress-nginx  --repo https://kubernetes.github.io/ingress-nginx  --namespace and --create-namespace --set controller.ingressClassResource.name=class1  --set controller.admissionWebhooks.enabled=false --set controller.service.nodePorts.http=30080 --set controller.service.nodePorts.https=30443 

# ถ้าชื่อ ingress1 ซ้ำกับอันเก่า ให้ลบอันเก่าก่อน
helm uninstall ingress1 --namespace and

# kubectl --namespace and get services -o wide -w ingress1-ingress-nginx-controller