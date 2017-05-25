# Slides

https://www.slideshare.net/section_io/kubernetes-in-the-wild

# Prepare

```
minikube start
minikube dashboard
```

Set up your hosts file to point `gluecon.com` to `192.168.99.100`.

# Basic Plumbing

```
kubectl apply -f 0.ingress.yaml
kubectl apply -f 1.egress.yaml
kubectl apply -f 2.ingress.yaml
```

Correct no egress config

```
kubectl create configmap egress-nginx-conf --from-file=default.conf
kubectl apply -f 3.egress.yaml
```

# Integrate Varnish Cache

```
kubectl create configmap varnish-default-vcl --from-file=default.vcl
kubectl apply -f 4.varnish.yaml
```

Now use the Kubernetes dashboard to update the `ingress-upstream` to change the pods selector from `egress` to `varnish`.

# Integrate OpenResty for Content Rewrite

```
kubectl create configmap openresty-conf --from-file=nginx.conf
kubectl apply -f 5.openresty.yaml
```

Now use the Kubernetes dashboard to update the `varnish-upstream` to change the pods selector from `egress` to `openresty`.

