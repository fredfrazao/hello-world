# Hello World example

This example shows the most basic idea behind Next. We have 2 pages: `pages/index.tsx` and `pages/about.tsx`. The former responds to `/` requests and the latter to `/about`. Using `next/link` you can add hyperlinks between them with universal routing capabilities. The `day` directory shows that you can have subdirectories.

## install next 
Execute :
```bash
npm i -g next
```

## install npm dependencies 
Execute :
```bash
npm install
```

## build project
Execute :
```bash
 npm run build
 ```

## build Docker file
Execute :
```bash
docker build -t ffr03/ffr03:last .
```

## Deploy to docker
Execute :
```bash
cd /terraform/docker
terraform plan
terraform apply
```

## Deploy azure infra
Execute :
```bash
cd /terraform/azure
terraform plan
terraform apply
```

## Deploy to k8s
Execute :
```bash
kubectl create -f hello.yml
```
