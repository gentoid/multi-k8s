docker build -t gentoid/multi-client -f client/Dockerfile client
docker build -t gentoid/multi-server -f server/Dockerfile server
docker build -t gentoid/multi-worker -f worker/Dockerfile worker

docker push gentoid/multi-client
docker push gentoid/multi-server
docker push gentoid/multi-worker

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=gentoid/multi-server
