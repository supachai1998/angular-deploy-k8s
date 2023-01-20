# image is supachai19998/angular-tour-of-heroes:test
docker build -t supachai19998/angular-tour-of-heroes:test .
# port 4200 is exposed
docker run -d -p 4200:4200 supachai19998/angular-tour-of-heroes:test
docker ps -l
# check the port by using curl
curl localhost:4200

# get the container id by image name
docker ps -a | grep supachai19998/angular-tour-of-heroes:test

# push
docker push supachai19998/angular-tour-of-heroes:test


# kubectl namespace is and
kubectl delete -f ./k8s/*
sleep 5 # รอให้ลบ pod ทั้งหมดใน servers ก่อน
kubectl apply -f ./k8s/*

docker stop $(docker ps -a | grep supachai19998/angular-tour-of-heroes:test | awk '{print $1}') # หยุดการทำงานของ docker container(เผื่อคนเครื่องไม่แรง)
docker rm $(docker ps -a | grep supachai19998/angular-tour-of-heroes:test | awk '{print $1}') # ลบ docker container ที่เราสร้างไว้ 
docker rmi supachai19998/angular-tour-of-heroes:test # ลบ image ที่เราสร้างไว้ จะได้ประหยัดพื้นที่

echo ""
echo ""
echo "all pods are running"
kubectl get pods -n and
echo ""
echo ""
echo "all pods are running"
kubectl get svc -n and
echo ""
echo ""
echo "all pods are running"
kubectl get pods --output=wide -n and
echo ""
echo ""
echo "all pods are running"
kubectl get all -n and -o wide
echo "-------------------"