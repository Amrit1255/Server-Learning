# 📘 ADVANCED COMPUTER NETWORKING TOPICS

---

# 📌 INTRODUCTION TO ADVANCED NETWORKING

Advanced Networking Concepts are modern techniques used to:
- Improve network performance
- Increase scalability
- Enhance security
- Optimize traffic flow
- Manage large enterprise networks

These technologies are heavily used in:
- Data centers
- Cloud platforms
- ISPs
- Enterprises
- Modern Internet infrastructure

---

# 📌 TOPICS COVERED

```text
Advanced Networking
│
├── NAT
├── QoS
├── MPLS
├── CDN
├── Load Balancing
├── Proxy Servers
├── VLAN
└── VPN Advanced Concepts
```

---

# 📘 NAT (NETWORK ADDRESS TRANSLATION)

---

# 📌 WHAT IS NAT?

NAT allows multiple private devices to use a single public IP address.

It is mainly implemented on:
```text
Routers
```

---

# 📌 WHY NAT IS NEEDED?

IPv4 has limited addresses.

Without NAT:
- Every device would require public IP.

NAT solves this problem by:
```text
Converting private IP ↔ public IP
```

---

# 📌 REAL LIFE ANALOGY

Suppose:
- One apartment building
- One main public address
- Multiple rooms inside

Similarly:
```text
One Public IP → Multiple Private Devices
```

---

# 📌 NAT WORKING

```text
Private Device
      ↓
NAT Router
      ↓
Public Internet
```

---

# 📌 EXAMPLE

Inside Network:
```text
192.168.1.5
192.168.1.6
192.168.1.7
```

Public IP:
```text
49.36.210.15
```

All devices share same public IP.

---

# 📘 TYPES OF NAT

```text
NAT Types
│
├── Static NAT
├── Dynamic NAT
└── PAT (Port Address Translation)
```

---

# 📘 STATIC NAT

One private IP mapped to one public IP.

---

# 📌 EXAMPLE

```text
192.168.1.5 ↔ 49.36.210.15
```

---

# 📌 ADVANTAGES

- Simple mapping
- Useful for servers

---

# 📌 DISADVANTAGES

- Requires many public IPs

---

# 📘 DYNAMIC NAT

Uses pool of public IPs.

Assigns public IP dynamically.

---

# 📘 PAT (PORT ADDRESS TRANSLATION)

Also called:
```text
NAT Overload
```

Most common NAT type.

---

# 📌 WORKING

Multiple devices share same public IP using different ports.

---

# 📌 EXAMPLE

| Private IP | Public IP | Port |
|---|---|---|
| 192.168.1.2 | 49.36.210.15 | 5001 |
| 192.168.1.3 | 49.36.210.15 | 5002 |

---

# 📌 ADVANTAGES OF NAT

- Conserves IPv4 addresses
- Improves security
- Reduces public IP usage

---

# 📌 DISADVANTAGES OF NAT

- Additional processing
- Some applications may fail

---

# 📘 QoS (QUALITY OF SERVICE)

---

# 📌 WHAT IS QoS?

QoS manages network traffic to ensure:
- Better performance
- Lower delay
- Higher priority for important traffic

---

# 📌 WHY QoS IS IMPORTANT?

Suppose network has:
- Video calls
- Gaming
- File downloads

Without QoS:
- Important traffic may lag.

QoS prioritizes:
```text
Critical traffic first
```

---

# 📌 REAL LIFE ANALOGY

Emergency vehicles receive priority on roads.

Similarly:
```text
QoS gives priority to important packets.
```

---

# 📌 QoS PARAMETERS

| Parameter | Meaning |
|---|---|
| Bandwidth | Data transfer capacity |
| Latency | Delay |
| Jitter | Variation in delay |
| Packet Loss | Lost packets |

---

# 📘 LATENCY

Time required for packet to travel from source to destination.

---

# 📌 LOW LATENCY IMPORTANT FOR

- Gaming
- Video calls
- Online trading

---

# 📘 JITTER

Variation in packet delay.

High jitter causes:
- Audio/video distortion

---

# 📘 PACKET LOSS

Packets lost during transmission.

Causes:
- Slow communication
- Poor streaming quality

---

# 📘 QoS TECHNIQUES

```text
QoS Techniques
│
├── Traffic Shaping
├── Traffic Policing
├── Queue Management
└── Priority Scheduling
```

---

# 📘 TRAFFIC SHAPING

Controls data transmission rate.

---

# 📘 PRIORITY QUEUING

High-priority packets transmitted first.

---

# 📌 EXAMPLE

Priority:
```text
Voice > Video > File Download
```

---

# 📌 APPLICATIONS OF QoS

- VoIP
- Video conferencing
- Streaming
- Enterprise networks

---

# 📘 MPLS (MULTI-PROTOCOL LABEL SWITCHING)

---

# 📌 WHAT IS MPLS?

MPLS is a high-performance packet forwarding technology.

Instead of using:
```text
IP lookup every time
```

MPLS uses:
```text
Labels
```

for faster forwarding.

---

# 📌 MPLS WORKING

```text
Packet Arrives
      ↓
Label Attached
      ↓
Forward using Label
```

---

# 📌 REAL LIFE ANALOGY

Instead of checking full address repeatedly:
```text
Use fast delivery code.
```

---

# 📌 MPLS COMPONENTS

| Component | Purpose |
|---|---|
| Label Edge Router (LER) | Adds/removes labels |
| Label Switch Router (LSR) | Forwards using labels |

---

# 📌 ADVANTAGES OF MPLS

- Faster forwarding
- Better traffic engineering
- Reduced latency

---

# 📌 APPLICATIONS

- ISP backbone
- Enterprise WANs
- VPN services

---

# 📘 CDN (CONTENT DELIVERY NETWORK)

---

# 📌 WHAT IS CDN?

CDN is a distributed network of servers used to deliver content faster.

---

# 📌 WHY CDN IS NEEDED?

Suppose website server located in:
```text
USA
```

User located in:
```text
India
```

Without CDN:
- Higher delay

CDN stores content closer to users.

---

# 📌 CDN ARCHITECTURE

```text
Main Server
      ↓
CDN Edge Servers
      ↓
Users
```

---

# 📌 EXAMPLE

When watching YouTube:
- Videos delivered from nearby CDN server.

---

# 📌 BENEFITS OF CDN

- Faster loading
- Reduced latency
- Better scalability
- Reduced server load

---

# 📌 POP (POINT OF PRESENCE)

CDN edge server location.

---

# 📘 LOAD BALANCING

---

# 📌 WHAT IS LOAD BALANCING?

Load balancing distributes traffic among multiple servers.

---

# 📌 WHY LOAD BALANCING IS IMPORTANT?

Without load balancing:
```text
Single server overload possible
```

With load balancing:
```text
Traffic distributed evenly
```

---

# 📌 REAL LIFE ANALOGY

Suppose supermarket has:
- Multiple billing counters

Customers distributed across counters.

---

# 📌 LOAD BALANCER WORKING

```text
Users
   ↓
Load Balancer
   ↓
Multiple Servers
```

---

# 📘 TYPES OF LOAD BALANCING

```text
Load Balancing
│
├── Round Robin
├── Least Connection
└── IP Hash
```

---

# 📘 ROUND ROBIN

Requests distributed sequentially.

---

# 📌 EXAMPLE

```text
Request 1 → Server A
Request 2 → Server B
Request 3 → Server C
```

---

# 📘 LEAST CONNECTION

Traffic sent to server with least active connections.

---

# 📘 IP HASH

Traffic routed based on client IP.

---

# 📌 ADVANTAGES OF LOAD BALANCING

- High availability
- Scalability
- Better performance

---

# 📌 APPLICATIONS

- Websites
- Cloud platforms
- Data centers

---

# 📘 PROXY SERVERS

---

# 📌 WHAT IS PROXY SERVER?

Proxy server acts as intermediary between:
```text
Client ↔ Internet
```

---

# 📌 WORKING

```text
Client
   ↓
Proxy Server
   ↓
Internet
```

---

# 📘 TYPES OF PROXY SERVERS

```text
Proxy Servers
│
├── Forward Proxy
├── Reverse Proxy
└── Transparent Proxy
```

---

# 📘 FORWARD PROXY

Represents client to Internet.

---

# 📌 USES

- Content filtering
- Privacy
- Access control

---

# 📘 REVERSE PROXY

Represents server to clients.

---

# 📌 USES

- Load balancing
- Security
- Caching

---

# 📘 TRANSPARENT PROXY

Users may not know proxy exists.

---

# 📌 ADVANTAGES OF PROXY

- Security
- Caching
- Anonymity

---

# 📌 DISADVANTAGES

- Additional delay
- Configuration complexity

---

# 📘 VLAN (VIRTUAL LOCAL AREA NETWORK)

---

# 📌 WHAT IS VLAN?

VLAN logically divides a physical network into multiple virtual networks.

---

# 📌 WHY VLAN IS USED?

Without VLAN:
- All devices in same broadcast domain.

With VLAN:
- Better segmentation
- Better security
- Reduced broadcast traffic

---

# 📌 VLAN EXAMPLE

```text
Office Switch
│
├── VLAN 10 → HR Department
├── VLAN 20 → Finance
└── VLAN 30 → IT Department
```

---

# 📌 BENEFITS OF VLAN

- Improved security
- Better traffic management
- Reduced congestion

---

# 📌 VLAN TAGGING

Uses:
```text
IEEE 802.1Q
```

standard.

---

# 📘 ACCESS PORT VS TRUNK PORT

| Access Port | Trunk Port |
|---|---|
| Single VLAN | Multiple VLANs |
| End devices | Switch-to-switch |

---

# 📘 VPN (VIRTUAL PRIVATE NETWORK)

---

# 📌 WHAT IS VPN?

VPN creates encrypted tunnel over public Internet.

---

# 📌 PURPOSE

Secure remote communication.

---

# 📌 VPN WORKING

```text
User
  ↓
Encrypted Tunnel
  ↓
VPN Server
  ↓
Internet
```

---

# 📘 TYPES OF VPN

```text
VPN Types
│
├── Remote Access VPN
├── Site-to-Site VPN
└── SSL VPN
```

---

# 📘 REMOTE ACCESS VPN

Allows individual users to connect securely.

---

# 📘 SITE-TO-SITE VPN

Connects entire networks securely.

---

# 📘 SSL VPN

Uses SSL/TLS for secure communication.

---

# 📌 ADVANTAGES OF VPN

- Privacy
- Secure communication
- Remote access

---

# 📌 DISADVANTAGES

- Reduced speed
- Configuration complexity

---

# 📘 SD-WAN (SOFTWARE DEFINED WAN)

Modern WAN technology using software-based management.

---

# 📌 BENEFITS

- Centralized management
- Intelligent routing
- Cost reduction

---

# 📘 IMPORTANT DIFFERENCES

---

# 🔹 NAT VS PAT

| NAT | PAT |
|---|---|
| One-to-one mapping | Many-to-one mapping |
| More public IPs | Single public IP |

---

# 🔹 FORWARD PROXY VS REVERSE PROXY

| Forward Proxy | Reverse Proxy |
|---|---|
| Represents client | Represents server |
| User privacy | Server protection |

---

# 🔹 VLAN VS LAN

| VLAN | LAN |
|---|---|
| Virtual segmentation | Physical network |
| Better security | Larger broadcast domain |

---

# 🔹 CDN VS LOAD BALANCING

| CDN | Load Balancing |
|---|---|
| Content distribution | Traffic distribution |
| Edge servers | Multiple backend servers |

---

# 📌 ADVANTAGES OF ADVANCED NETWORKING

- Scalability
- Security
- Faster communication
- Better traffic management
- High availability

---

# 📌 DISADVANTAGES

- Higher complexity
- Expensive infrastructure
- Requires skilled administration

---

# 📌 IMPORTANT TERMS

| Term | Meaning |
|---|---|
| Latency | Communication delay |
| Throughput | Data transfer rate |
| Broadcast Domain | Group receiving broadcasts |
| Tunnel | Encrypted communication path |

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ NAT vs PAT  
⭐ QoS Parameters  
⭐ MPLS Working  
⭐ CDN Architecture  
⭐ Load Balancing Algorithms  
⭐ Proxy Servers  
⭐ VLAN Tagging  
⭐ VPN Types  
⭐ Access vs Trunk Port  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is NAT?

Technique that converts private IPs into public IPs.

---

## Q2. What is QoS?

Technique for prioritizing important network traffic.

---

## Q3. What is CDN?

Distributed network delivering content closer to users.

---

## Q4. Difference between VLAN and LAN?

VLAN provides logical segmentation while LAN is physical network.

---

## Q5. What is VPN?

Encrypted tunnel for secure communication over Internet.

---

# 📌 LAST MINUTE REVISION

```text
Advanced Networking
│
├── NAT
│   ├── Static NAT
│   ├── Dynamic NAT
│   └── PAT
│
├── QoS
│
├── MPLS
├── CDN
├── Load Balancing
├── Proxy Servers
├── VLAN
└── VPN
```
