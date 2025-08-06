** checkpoint 
 - /etc/docker/certs.d/myregistry.com -> /etc/docker/certs.d/myregistry.com:8443/
 - copy docker binary from host to container 
 - restart docker for registry with certification 
 - push project code to gitlab

** Gitlab server config 
1. create gitlab token from gitlab 

2. gitlab network config for local hook on admin area

** Jenkins server config

3. jenkins plugin
 - gitlab branch source
 - docker pipeline

4. jenkins credential
  - gitlab token
  - gitlab checkout
  - registry-auth

5. jenkins system config for gitlab server

6. create multi-branch pipeline 

