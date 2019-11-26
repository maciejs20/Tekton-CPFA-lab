kubectl delete -f echo-HW-TSK.yaml 
kubectl delete -f echo-HW-TRUN.yaml 

sleep 1

kubectl apply -f echo-HW-TSK.yaml
kubectl apply -f echo-HW-TRUN.yaml 

sleep 1
kubectl get pods

POD=$(kubectl get pods | grep hello-world | cut -f 1 -d " ")
echo "POD is: $POD"

while true; do
  kubectl logs $POD
  sleep 3
done
