# k8sApps
This is a sample project to test deployment of two apps with k8s
Step 1: clone the project and cd into project directory
Step 2: cd app1/docker
Step 3: ./build-image.sh
Step 4: cd app1/k8s
Step 5 deploy.sh
step 6: Repeat the step 2- 5 for app2
Step 7: Apply the ingress logic to securely expose the internal services from each app

Bonus: We could automate the above procedure using Jenkins file inside each project


