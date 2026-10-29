# DevSecureOps — quick-start mini project

A small Java Spring Boot application demonstrating Maven testing, Jenkins CI, Docker packaging, Docker Compose, Kubernetes deployment, and an optional Ansible deployment.

## Requirements
- Docker Desktop (Windows) or Docker Engine (Linux)
- Internet connection for the first build (Maven dependencies and base images)
- For Kubernetes: `kubectl` and Minikube, or another local Kubernetes cluster
- For Jenkins: Jenkins with Git, Maven, and Docker available to the agent

## Fastest demo (Docker Compose)
From this folder, open PowerShell or a terminal:

```bash
docker compose up --build -d
docker compose ps
```

Open http://localhost:8080 and http://localhost:8080/health.

Stop it:
```bash
docker compose down
```

## Kubernetes demo (requires Minikube)
Run these commands from this folder:

```bash
minikube start
docker build -t devsecureops:1.0 .
minikube image load devsecureops:1.0
kubectl apply -f k8s/deployment.yaml
kubectl rollout status deployment/devsecureops
kubectl get pods
kubectl get services
kubectl port-forward service/devsecureops-service 8080:8080
```

Keep the port-forward command running and open http://localhost:8080 in a browser. In another terminal, you can check:
```bash
kubectl get deployments,pods,services
```

To show scaling:
```bash
kubectl scale deployment/devsecureops --replicas=3
kubectl get pods
```

To demonstrate rollback after a rollout:
```bash
kubectl rollout history deployment/devsecureops
kubectl rollout undo deployment/devsecureops
```

Cleanup:
```bash
kubectl delete -f k8s/deployment.yaml
minikube stop
```

## Jenkins pipeline
1. Push this project to a GitHub repository.
2. In Jenkins, create a **Pipeline** job.
3. Configure Pipeline from SCM → Git and enter your repository URL.
4. Ensure the Jenkins agent has Java 17, Maven, and Docker CLI/daemon access.
5. Build the job. The included `Jenkinsfile` runs tests and builds the Docker image.

Note: On Windows, the included Jenkinsfile uses Linux shell steps (`sh`), intended for a Linux Jenkins agent such as Ubuntu.

## Optional Ansible demo
Ansible is most straightforward on Linux/WSL. Install the Docker collection and Python SDK:

```bash
ansible-galaxy collection install community.docker
python3 -m pip install docker
ansible-playbook -i ansible/inventory.ini ansible/deploy.yml
```

Run this from the project root. Docker must be running. The playbook builds and starts the app locally on port 8080.

## Project explanation
- **Git/GitHub:** version history and collaboration
- **Maven:** compiles code and runs unit tests
- **Jenkins:** automates build/test/image creation
- **Docker:** packages app and runtime into a container
- **Kubernetes:** manages replicas, probes, service access, and rollout/rollback
- **Ansible:** automates repeatable container deployment

This is a learning/demo project, not a production-hardened service. Kubernetes and Jenkins require separate installation/configuration; the ZIP does not install them automatically.
