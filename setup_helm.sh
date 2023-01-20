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
helm install ingress1 ingress-nginx/ingress-nginx --namespace and --set controller.ingressClassResource.name=class1
# ถ้าชื่อ ingress1 ซ้ำกับอันเก่า ให้ลบอันเก่าก่อน
# helm uninstall ingress1 --namespace and
