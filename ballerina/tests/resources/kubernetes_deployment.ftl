apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${appName}
  namespace: ${namespace}
  labels:
    app: ${appName}
    version: ${appVersion}
    team: ${teamName}
spec:
  replicas: ${replicas}
  selector:
    matchLabels:
      app: ${appName}
  template:
    metadata:
      labels:
        app: ${appName}
    spec:
      containers:
        - name: ${appName}
          image: ${imageRepo}/${appName}:${appVersion}
          ports:
            - containerPort: ${containerPort}
          resources:
            requests:
              cpu: "${cpuRequest}"
              memory: "${memoryRequest}"
            limits:
              cpu: "${cpuLimit}"
              memory: "${memoryLimit}"
