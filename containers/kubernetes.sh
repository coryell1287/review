kubectl run --generator=run-pod/v1 --image=mongo:4.2 mongo-db


apiVersion: v1
kind: PersistentVolume
metadata:
  name: mo-data-pv
  labels:
    type: local
spec:
  storageClassName: generic
  capacity:
    storage: 500Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/var/lib/mongo"



kubectl apply -f mongo-pv.yaml
kubectl create -f mongo-pv.yaml


verify creation
kubectl get persistentvolumes mo-data-pv
kubectl describe persistentvolumes mo-data-pv



deployment.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: easy-notes
  name: easy-notes
spec:
  replicas: 1
  selector:
    matchLabels:
      app: easy-notes-pod
  template:
    metadata:
      labels:
        app: easy-notes-pod
    spec:
      containers:
      - name: easy-notes
        env:
        - name: MONGO_URL
          value: mongodb://mongodb-service:27017/easy-notes
        image: wshihadeh/node-easy-notes-app:latest
        ports:
        - containerPort: 3000
      restartPolicy: Always




# Service.yml 
apiVersion: v1
kind: Service
metadata:
  labels:
    app: easy-notes
  name: easy-notes-service
spec:
  ports:
  - port: 8080
    targetPort: 3000
  selector:
    app: easy-notes-pod
  type: ClusterIP



# default backend
apiVersion: apps/v1
kind: Deployment
metadata:
  name: default-http-backend
  labels:
    app: default-http-backend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: default-http-backend
  template:
    metadata:
      labels:
        app: default-http-backend
    spec:
      terminationGracePeriodSeconds: 60
      containers:
      - name: default-http-backend
        image: gcr.io/google_containers/defaultbackend:1.4
        livenessProbe:
          httpGet:
            path: /healthz
            port: 8080
            scheme: HTTP
          initialDelaySeconds: 30
          timeoutSeconds: 5
        ports:
        - containerPort: 8080
---
apiVersion: v1
kind: Service
metadata:
  name: default-http-backend
  labels:
    app: default-http-backend
spec:
  type: ClusterIP
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: default-http-backend



# nginx
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-ingress-controller
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ingress-nginx
  template:
    metadata:
      labels:
        app: ingress-nginx
    spec:
      containers:
        - name: nginx-ingress-controller
          image: quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.13.0
          args:
            - /nginx-ingress-controller
            - --default-backend-service=default/default-http-backend
            - --annotations-prefix=nginx.ingress.kubernetes.io
          env:
            - name: POD_NAME
              valueFrom:
                fieldRef:
                  fieldPath: metadata.name
            - name: POD_NAMESPACE
              valueFrom:
                fieldRef:
                  fieldPath: metadata.namespace
          ports:
          - name: http
            containerPort: 80
          - name: https
            containerPort: 443

# nginx service
apiVersion: v1
kind: Service
metadata:
  name: ingress-nginx
spec:
  type: LoadBalancer
  ports:
  - name: http
    port: 80
    targetPort: 80
    protocol: TCP
  - name: https
    port: 443
    targetPort: 443
    protocol: TCP
  selector:
    app: ingress-nginx


# forward traffic
apiVersion: networking.k8s.io/v1beta1
kind: Ingress
metadata:
  name: easy-notes-ingress
spec:
  rules:
  - host: easynotes.lvh.me # custom hostname
    http:
      paths:
      - backend:
          serviceName: easy-notes-service
          servicePort: 8080

kubectl apply -f ${file_name}
kubectl create -f ${file_name}

# https://eskala.io/tutorial/the-node-js-developers-guide-to-kubernetes-part-ii/
