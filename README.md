Assumtions
1. Three environtmets are given Dev, QA and UAT.
2. Since QA and UAT are similar so, only 2 environments are needed.
3. Need to create jenkins declarative pipeline.
4. Different docker images will be created for different environments.
5. Application properties will be stored inside docker image.
6. Kubernetes load balancer, ingress, service and pod auto scaler are already in place.
7. Dev and QA environments are both in same cluster seperated by different namespaces.

Working
1. Jenkinsfile along with all the scripts will be present in code repo.
2. User will setup the pipeline in jenkins using the option "Pipeline script from scm".
3. User will provide the path of jenins file.
4. After completing the setup user will run the pipeline only once.
5. After this jenkins will check the remote repo for new changes every 5 minutes.
6. There is only 1 diff between Dev and QA pipeline. In QA there is an approval stage before deployment stage.

Suggestions/Improvements
1. We can use Configmap and Secrets to store all the application properties and can use same image in different environments.
2. We can use helm to manage all the kubernetes manifests.