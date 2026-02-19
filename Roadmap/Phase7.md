# 🐳 Phase 7 — Docker & Containers (Weeks 17–21)

> **Goal:** Learn the modern way to package, ship, and run applications consistently across any environment.  
> Write once, run anywhere — no more "it works on my machine" problems.

---

## 📌 Table of Contents

- [Topic 1 — What is Docker & Why Does it Matter?](#-topic-1-what-is-docker--why-does-it-matter)
- [Topic 2 — Installing Docker](#-topic-2-installing-docker)
- [Topic 3 — Essential Docker Commands](#-topic-3-essential-docker-commands)
- [Topic 4 — Writing a Dockerfile](#-topic-4-writing-a-dockerfile)
- [Topic 5 — Docker Volumes — Persistent Data](#-topic-5-docker-volumes--persistent-data)
- [Topic 6 — Docker Networks](#-topic-6-docker-networks)
- [Topic 7 — Docker Compose — Multi-Container Apps](#-topic-7-docker-compose--multi-container-apps)
- [Topic 8 — Docker vs Virtual Machines](#-topic-8-docker-vs-virtual-machines)
- [Topic 9 — Docker in Production Best Practices](#-topic-9-docker-in-production--best-practices)
- [Phase 7 Checklist](#-phase-7-checklist)
- [Phase 7 Hands-On Tasks](#-phase-7-hands-on-tasks)
- [Resources](#-resources-for-phase-7)

---

## 📖 Topic 1: What is Docker & Why Does it Matter?

### The Problem Docker Solves

```
Developer's Laptop          Staging Server         Production Server
      |                          |                        |
  "It works                 "It crashes             "It's broken
   on my machine!"           on mine!"               here too!"
      |                          |                        |
  Node 18                    Node 16                  Node 14
  Ubuntu 22                  CentOS 7                 Debian 9
  Redis 7                    Redis 5                  No Redis
```

### Docker's Solution

```
Developer's Laptop          Staging Server         Production Server
      |                          |                        |
  [ Docker Container ]    [ Docker Container ]    [ Docker Container ]
  Node 18                  Node 18                  Node 18
  Ubuntu 22                Ubuntu 22                Ubuntu 22
  Redis 7                  Redis 7                  Redis 7

  "Works everywhere — the environment travels WITH the app!"
```

### Key Concepts

| Concept | What It Is | Real World Analogy |
|---------|-----------|-------------------|
| **Image** | Blueprint / template for a container | A recipe |
| **Container** | A running instance of an image | The cooked meal |
| **Dockerfile** | Instructions to build an image | The recipe card |
| **Registry** | Storage for images | A cookbook library |
| **Docker Hub** | Public image registry | GitHub for Docker images |
| **Volume** | Persistent storage for containers | A USB drive attached to a container |
| **Network** | Communication between containers | A LAN between computers |

---

## 📖 Topic 2: Installing Docker

```bash
# Update packages and install prerequisites
sudo apt update
sudo apt install ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add the Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine and Compose plugin
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start Docker and enable on boot
sudo systemctl start docker
sudo systemctl enable docker

# Add your user to the docker group (avoids needing sudo every time)
sudo usermod -aG docker $USER
newgrp docker

# Verify the installation
docker --version
docker run hello-world
```

---

## 📖 Topic 3: Essential Docker Commands

### Images

```bash
# Pull an image from Docker Hub
docker pull nginx
docker pull node:18
docker pull postgres:15

# List all locally stored images
docker images

# Remove an image
docker rmi nginx

# Search Docker Hub for images
docker search nginx

# Inspect image details
docker inspect nginx
```

### Containers

```bash
# Run a container (foreground)
docker run nginx

# Run in detached mode (background)
docker run -d nginx

# Run with a custom name
docker run -d --name mywebserver nginx

# Run with port mapping  →  host_port:container_port
docker run -d -p 8080:80 nginx
# Access at: http://localhost:8080

# Run with environment variables
docker run -d -e NODE_ENV=production -e PORT=3000 myapp

# Run interactively with a shell
docker run -it ubuntu bash
docker run -it node:18 node        # Opens Node.js REPL

# Run and auto-remove when done
docker run --rm ubuntu echo "hello"

# List running containers
docker ps

# List ALL containers (including stopped)
docker ps -a

# Stop a running container
docker stop mywebserver

# Start a stopped container
docker start mywebserver

# Restart a container
docker restart mywebserver

# Remove a stopped container
docker rm mywebserver

# Force remove a running container
docker rm -f mywebserver
```

### Inspecting & Debugging

```bash
# View container logs
docker logs mywebserver
docker logs -f mywebserver             # Follow logs live
docker logs --tail 100 mywebserver     # Last 100 lines only

# Open a shell inside a running container
docker exec -it mywebserver bash

# Run a command inside a running container
docker exec -it mywebserver ls /etc/nginx

# View live CPU, memory, and network stats
docker stats

# Inspect full container details (JSON)
docker inspect mywebserver

# View processes running inside a container
docker top mywebserver
```

---

## 📖 Topic 4: Writing a Dockerfile

A **Dockerfile** is a text file with step-by-step instructions Docker uses to build your custom image.

### Node.js Dockerfile

```dockerfile
# 1. Base image — what we build on top of
FROM node:18-alpine

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy package files FIRST (enables Docker layer caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install --production

# 5. Copy the rest of the application source code
COPY . .

# 6. Document the port the app listens on
EXPOSE 3000

# 7. Default command to run when container starts
CMD ["node", "app.js"]
```

### Python Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
```

### Build & Run Your Image

```bash
# Build image from Dockerfile in current directory
docker build -t myapp:latest .

# Build with a specific version tag
docker build -t myapp:1.0.0 .

# Run your custom image
docker run -d -p 3000:3000 --name myapp myapp:latest

# Test it
curl http://localhost:3000
```

### Docker Layer Caching — Important!

```dockerfile
# ✅ CORRECT — dependencies are cached separately from code changes
COPY package*.json ./
RUN npm install           # Only re-runs if package.json changed
COPY . .                  # Code changes don't invalidate the npm cache

# ❌ WRONG — npm install re-runs on every single code change
COPY . .
RUN npm install
```

### .dockerignore File

```bash
nano .dockerignore
```

```
node_modules
.git
.env
*.log
.DS_Store
coverage
dist
```

> 💡 Always create a `.dockerignore` — it keeps your image small and prevents secrets from being baked into it.

---

## 📖 Topic 5: Docker Volumes — Persistent Data

By default, **all data inside a container is destroyed when the container is removed**. Volumes solve this.

```
Without Volume:                     With Volume:
  Container removed → Data gone ❌    Container removed → Data safe ✅
```

### Types of Storage

```bash
# 1. Named Volume — managed by Docker (recommended for databases)
docker run -d \
  --name postgres \
  -e POSTGRES_PASSWORD=secret \
  -v pgdata:/var/lib/postgresql/data \
  postgres:15

# 2. Bind Mount — maps a host folder directly into the container (great for dev)
docker run -d \
  --name myapp \
  -v /home/user/myapp:/app \
  -p 3000:3000 \
  myapp:latest
```

### Volume Management Commands

```bash
# List all volumes
docker volume ls

# Create a named volume manually
docker volume create pgdata

# Inspect a volume (see where data is stored on host)
docker volume inspect pgdata

# Remove a specific volume
docker volume rm pgdata

# Remove all unused volumes (careful!)
docker volume prune
```

---

## 📖 Topic 6: Docker Networks

Containers need to communicate with each other — Docker networks make this possible.

```bash
# List all networks
docker network ls

# Create a custom network
docker network create mynetwork

# Run containers on the same network
docker run -d --name postgres --network mynetwork postgres:15
docker run -d --name myapp   --network mynetwork myapp:latest

# Now myapp can reach postgres by hostname "postgres"
# Connection string inside myapp:
# postgresql://postgres:5432/mydb

# Inspect a network
docker network inspect mynetwork

# Remove a network
docker network rm mynetwork
```

### Default Network Types

| Network | Description |
|---------|-------------|
| `bridge` | Default — containers communicate via IP address |
| `host` | Container shares the host's network stack (no isolation) |
| `none` | No networking at all |
| Custom | Containers reach each other by **name** (built-in DNS) ✅ |

> 💡 Always use a **custom named network** in production — containers can reach each other by service name instead of IP address.

---

## 📖 Topic 7: Docker Compose — Multi-Container Apps

**Docker Compose** lets you define and manage an entire multi-container application stack in a single YAML file — and start everything with one command.

### docker-compose.yml — Full Stack Example

```yaml
version: '3.8'

services:

  # ── Node.js App ─────────────────────────────────────
  app:
    build: .
    container_name: myapp
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=production
      - DATABASE_URL=postgresql://myuser:mypassword@postgres:5432/mydb
      - REDIS_URL=redis://redis:6379
    depends_on:
      - postgres
      - redis
    networks:
      - appnetwork
    restart: unless-stopped

  # ── PostgreSQL Database ─────────────────────────────
  postgres:
    image: postgres:15
    container_name: postgres
    environment:
      POSTGRES_USER: myuser
      POSTGRES_PASSWORD: mypassword
      POSTGRES_DB: mydb
    volumes:
      - pgdata:/var/lib/postgresql/data
    networks:
      - appnetwork
    restart: unless-stopped

  # ── Redis Cache ─────────────────────────────────────
  redis:
    image: redis:7-alpine
    container_name: redis
    command: redis-server --requirepass redispassword
    volumes:
      - redisdata:/data
    networks:
      - appnetwork
    restart: unless-stopped

  # ── Nginx Reverse Proxy ─────────────────────────────
  nginx:
    image: nginx:alpine
    container_name: nginx
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
      - ./ssl:/etc/nginx/ssl
    depends_on:
      - app
    networks:
      - appnetwork
    restart: unless-stopped

volumes:
  pgdata:
  redisdata:

networks:
  appnetwork:
    driver: bridge
```

### Docker Compose Commands

```bash
# Start all services in detached mode
docker compose up -d

# Start and rebuild images (after code changes)
docker compose up -d --build

# View status of all services
docker compose ps

# View logs for all services
docker compose logs

# Follow logs for a specific service
docker compose logs -f app

# Stop all services (keeps containers and volumes)
docker compose down

# Stop and remove everything including volumes ⚠️ (wipes database!)
docker compose down -v

# Restart a specific service only
docker compose restart app

# Open a shell inside a running service
docker compose exec app bash
docker compose exec postgres psql -U myuser mydb

# Scale a service to multiple instances
docker compose up -d --scale app=3
```

---

## 📖 Topic 8: Docker vs Virtual Machines

```
Virtual Machine                         Docker Container
┌───────────────────────┐               ┌───────────────────────┐
│   Your Application    │               │   Your Application    │
├───────────────────────┤               ├───────────────────────┤
│   Guest OS            │               │   Container Runtime   │
│   (Full Linux ~1GB)   │               │   (Shared Host Kernel)│
├───────────────────────┤               ├───────────────────────┤
│   Hypervisor          │               │   Host OS             │
├───────────────────────┤               ├───────────────────────┤
│   Host Hardware       │               │   Host Hardware       │
└───────────────────────┘               └───────────────────────┘
```

| Feature | Virtual Machine | Docker Container |
|---------|----------------|-----------------|
| Startup time | Minutes | Seconds |
| Image size | GBs | MBs |
| Isolation level | Complete (own OS kernel) | Process-level |
| Performance | Overhead from hypervisor | Near-native speed |
| Portability | Less portable | Highly portable |
| Best use case | Full OS isolation needed | App packaging & deployment |

---

## 📖 Topic 9: Docker in Production — Best Practices

### Production-Ready Dockerfile

```dockerfile
# 1. Pin to specific versions — never use :latest in production
FROM node:18.19-alpine3.19

# 2. Use minimal Alpine base images (tiny & secure)
# node:18-alpine ≈ 50MB vs node:18 ≈ 950MB

WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

# 3. Run as a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000
CMD ["node", "app.js"]
```

### Multi-Stage Build — Reduce Image Size

```dockerfile
# Stage 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

# Stage 2: Production (only copies what's needed)
FROM node:18-alpine AS production
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
CMD ["node", "dist/app.js"]
```

### Production Rules

```
✅ Pin image versions — never use :latest in production
✅ Use Alpine-based images — they are tiny and have a smaller attack surface
✅ Run containers as non-root users
✅ Never store secrets in Dockerfiles or bake them into images
✅ Always create a .dockerignore file
✅ Use multi-stage builds to strip out dev dependencies
✅ Set resource limits (CPU and memory) on containers
✅ Add HEALTHCHECK instructions so Docker knows if your app is alive
✅ Always use named volumes for database data — never anonymous volumes
✅ Set restart: unless-stopped for all production containers
```

---

## ✅ Phase 7 Checklist

Before moving to Phase 8, make sure you can confidently tick all of these:

- [ ] Can you explain what Docker is and the problem it solves?
- [ ] Can you install Docker on a fresh Ubuntu server?
- [ ] Can you pull images and run containers from Docker Hub?
- [ ] Can you write a Dockerfile for a Node.js or Python app?
- [ ] Do you understand Docker layer caching and how to use it?
- [ ] Can you use Docker volumes to persist database data across container restarts?
- [ ] Can you create Docker networks and connect multiple containers together?
- [ ] Can you write a `docker-compose.yml` for a full stack app?
- [ ] Can you use all essential Docker Compose commands?
- [ ] Do you know and apply Docker production best practices?

---

## 🎯 Phase 7 Hands-On Tasks

### Task 1 — Run Your First Container
> Pull the `nginx` image from Docker Hub, run it with port `8080` mapped to container port `80`, and open `http://localhost:8080` in your browser.

### Task 2 — Write a Dockerfile
> Write a Dockerfile for a simple Node.js Express app. Build the image, run it as a container, and verify it responds to `curl http://localhost:3000`.

### Task 3 — Persist Data with Volumes
> Run a PostgreSQL container with a named volume. Create a table and insert data. Delete the container entirely. Recreate it using the same volume and confirm all data survived.

### Task 4 — Docker Compose Stack
> Write a `docker-compose.yml` that runs your Node.js app + PostgreSQL + Redis together on the same custom network. Start the entire stack with one command and verify all services communicate.

### Task 5 — Optimize Your Image
> Take your Dockerfile from Task 2 and optimize it by:
> - Switching to an Alpine base image
> - Adding a proper `.dockerignore`
> - Fixing layer caching order
>
> Compare image sizes before and after: `docker images`

---

## 📚 Resources for Phase 7

| Resource | Type | Link |
|----------|------|-------|
| Docker Official Documentation | 📄 Docs | [docs.docker.com](https://docs.docker.com) |
| Docker Hub — Image Registry | 🗄️ Registry | [hub.docker.com](https://hub.docker.com) |
| Play with Docker — Free Online Lab | 🎮 Practice | [labs.play-with-docker.com](https://labs.play-with-docker.com) |
| Docker Compose Reference | 📄 Docs | [docs.docker.com/compose](https://docs.docker.com/compose/) |
| NetworkChuck — Docker Series | 🎥 YouTube | Search on YouTube |
| TechWorld with Nana — Docker Tutorial | 🎥 YouTube | Search on YouTube |

---

## ⏭️ What's Next?

Once your checklist is complete and all tasks are done:

### 👉 [Phase 8 — Cloud & DevOps Basics](./PHASE_8_CLOUD_DEVOPS.md) ☁️

> You'll take everything you've learned and apply it in the cloud — AWS, CI/CD pipelines, Infrastructure as Code with Terraform, and monitoring with Grafana.

---

> 💬 **Tip:** Docker Compose is what you'll use in **almost every real project**. Practice writing `docker-compose.yml` from scratch until it feels natural. The more you write it, the faster you'll get.