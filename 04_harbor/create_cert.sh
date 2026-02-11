#!/bin/bash

openssl genrsa -out ca.key 4096

openssl req -x509 -new -nodes -sha512 -days 3650 \
 -subj "/CN=myregistry.com" \
 -key ca.key \
 -out ca.crt

openssl genrsa -out myregistry.com.key 4096

openssl req -sha512 -new \
    -subj "/CN=myregistry.com" \
    -key myregistry.com.key \
    -out myregistry.com.csr

cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=myregistry.com
EOF

openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -CA ca.crt -CAkey ca.key -CAcreateserial \
    -in myregistry.com.csr \
    -out myregistry.com.crt 

mkdir -p /data/cert
cp myregistry.com.crt myregistry.com.key /data/cert

openssl x509 -inform PEM -in myregistry.com.crt -out myregistry.com.cert

mkdir -p /etc/docker/certs.d/myregistry.com/

cp myregistry.com.cert /etc/docker/certs.d/myregistry.com/
cp myregistry.com.key /etc/docker/certs.d/myregistry.com/
cp ca.crt /etc/docker/certs.d/myregistry.com/

sudo update-ca-trust extract
sudo cp ca.crt /etc/pki/ca-trust/source/anchors/myregistry.com.crt
