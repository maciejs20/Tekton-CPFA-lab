LISTA="skaffold-git-PIPRES.yaml skaffold-image-leeroy-web-PIPRES.yaml build-docker-image-from-git-source-TSK.yaml build-docker-image-from-git-source-task-run-TR.yaml"

#LISTA="skaffold-git-PIPRES.yaml skaffold-image-leeroy-web-PIPRES.yaml build-docker-image-from-git-source-TESTwq.yaml build-docker-image-from-git-source-task-run-TR.yaml"
for ARGS in $LISTA ; do \
   kubectl delete -f $ARGS
done


for ARGS in $LISTA ; do \
   kubectl apply -f $ARGS
done


kubectl get pods
echo  "----------------"

POD=$(kubectl get pods | grep build-docker-image-from | cut -f 1 -d " ")
echo "POD is: $POD"

kubectl describe taskrun.tekton.dev/build-docker-image-from-git-source-task-run

while true; do
  kubectl logs $POD -c step-build-and-push
  sleep 3
done
