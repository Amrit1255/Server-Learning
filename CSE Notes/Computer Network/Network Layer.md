# 📘 NETWORK LAYER (LAYER 3)

---

# 📌 INTRODUCTION TO NETWORK LAYER

The Network Layer is the **third layer** of the OSI Model.

It is responsible for:
- Logical addressing
- Routing
- Path determination
- Packet forwarding
- Inter-network communication

The Data Link Layer handles communication inside the same network.

The Network Layer handles:

```text
Communication between different networks.
```

---

# 📌 POSITION OF NETWORK LAYER IN OSI MODEL

```text
+-------------------+
| 7. Application    |
+-------------------+
| 6. Presentation   |
+-------------------+
| 5. Session        |
+-------------------+
| 4. Transport      |
+-------------------+
| 3. Network Layer  |
+-------------------+
| 2. Data Link      |
+-------------------+
| 1. Physical Layer |
+-------------------+
```

---

# 📌 MAIN FUNCTIONS OF NETWORK LAYER

| Function | Description |
|---|---|
| Logical Addressing | Uses IP addresses |
| Routing | Finds best path |
| Packet Forwarding | Sends packets to destination |
| Fragmentation | Divides packets |
| Congestion Control | Controls traffic load |
| Inter-networking | Connects multiple networks |

---

# 📌 REAL LIFE ANALOGY

Suppose you want to send a parcel from Delhi to New York.

| Networking Concept | Real Life Example |
|---|---|
| Packet | Parcel |
| Router | Post Office |
| IP Address | House Address |
| Routing | Selecting best road |
| Congestion | Traffic Jam |

The Network Layer acts like:
```text
Global transportation and route management system
```

---

# 📘 IP ADDRESSING

---

# 📌 WHAT IS AN IP ADDRESS?

IP Address stands for:

```text
Internet Protocol Address
```

It uniquely identifies a device on a network.

Without IP addresses:
- Devices cannot communicate properly.

---

# 📌 TYPES OF IP ADDRESSING

```text
IP Addressing
│
├── IPv4
└── IPv6
```

---

# 📘 IPv4 (INTERNET PROTOCOL VERSION 4)

IPv4 is the most widely used addressing system.

---

# 📌 FEATURES OF IPv4

| Feature | Value |
|---|---|
| Address Size | 32 bits |
| Number Format | Decimal |
| Total Addresses | ~4.3 Billion |
| Example | 192.168.1.1 |

---

# 📌 IPv4 STRUCTURE

IPv4 consists of 4 octets.

```text
192.168.1.10
```

Each octet:
```text
0 to 255
```

---

# 📌 BINARY REPRESENTATION

```text
192.168.1.1

11000000.10101000.00000001.00000001
```

---

# 📌 NETWORK ID & HOST ID

IPv4 address contains:

```text
+----------------+----------------+
| Network Part   | Host Part      |
+----------------+----------------+
```

---

# 📌 EXAMPLE

```text
IP Address: 192.168.1.25
Subnet Mask: 255.255.255.0
```

Network Part:
```text
192.168.1
```

Host Part:
```text
25
```

---

# 📌 CLASSES OF IPv4

---

# 🔹 CLASS A

| Feature | Value |
|---|---|
| First Bit | 0 |
| Range | 1 – 126 |
| Default Mask | 255.0.0.0 |
| Networks | Few |
| Hosts | Very Large |

---

# 🔹 CLASS B

| Feature | Value |
|---|---|
| Range | 128 – 191 |
| Default Mask | 255.255.0.0 |

---

# 🔹 CLASS C

| Feature | Value |
|---|---|
| Range | 192 – 223 |
| Default Mask | 255.255.255.0 |

---

# 🔹 CLASS D

Used for:
```text
Multicasting
```

Range:
```text
224 – 239
```

---

# 🔹 CLASS E

Used for:
```text
Research and experiments
```

Range:
```text
240 – 255
```

---

# 📌 PRIVATE IP ADDRESSES

Private IPs are used inside local networks.

---

# 📌 RANGES

| Class | Range |
|---|---|
| Class A | 10.0.0.0 – 10.255.255.255 |
| Class B | 172.16.0.0 – 172.31.255.255 |
| Class C | 192.168.0.0 – 192.168.255.255 |

---

# 📌 PUBLIC VS PRIVATE IP

| Public IP | Private IP |
|---|---|
| Globally unique | Used locally |
| Internet accessible | Not directly accessible |
| Assigned by ISP | Assigned locally |

---

# 📘 IPv6 (INTERNET PROTOCOL VERSION 6)

IPv6 was developed because IPv4 addresses were running out.

---

# 📌 FEATURES OF IPv6

| Feature | Value |
|---|---|
| Address Size | 128 bits |
| Number Format | Hexadecimal |
| Huge Address Space | Yes |
| Example | 2001:db8::1 |

---

# 📌 EXAMPLE OF IPv6

```text
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

---

# 📌 ADVANTAGES OF IPv6

- Massive address space
- Better security
- Faster routing
- No NAT required

---

# 📌 IPv4 VS IPv6

| IPv4 | IPv6 |
|---|---|
| 32-bit | 128-bit |
| Decimal | Hexadecimal |
| Limited addresses | Huge addresses |
| NAT required | NAT unnecessary |

---

# 📘 SUBNETTING

---

# 📌 WHAT IS SUBNETTING?

Subnetting means dividing one large network into smaller networks.

---

# 📌 WHY SUBNETTING?

- Better management
- Improved security
- Reduced congestion
- Efficient IP usage

---

# 📌 REAL LIFE ANALOGY

Suppose one large school is divided into:
- Classrooms
- Departments
- Labs

Similarly:
```text
Large network → Smaller subnetworks
```

---

# 📌 SUBNET MASK

Subnet mask identifies:
- Network portion
- Host portion

---

# 📌 COMMON SUBNET MASKS

| CIDR | Subnet Mask |
|---|---|
| /8 | 255.0.0.0 |
| /16 | 255.255.0.0 |
| /24 | 255.255.255.0 |

---

# 📌 CIDR NOTATION

CIDR stands for:

```text
Classless Inter-Domain Routing
```

Example:
```text
192.168.1.0/24
```

Means:
```text
24 bits = network part
```

---

# 📌 SUBNETTING EXAMPLE

Suppose:
```text
192.168.1.0/24
```

Need:
```text
4 subnets
```

Borrow:
```text
2 bits
```

New subnet:
```text
/26
```

---

# 📌 RESULT

| Subnet | Range |
|---|---|
| 192.168.1.0/26 | 0 – 63 |
| 192.168.1.64/26 | 64 – 127 |
| 192.168.1.128/26 | 128 – 191 |
| 192.168.1.192/26 | 192 – 255 |

---

# 📌 IMPORTANT FORMULAS

---

# 🔹 NUMBER OF SUBNETS

```text
2^n
```

Where:
```text
n = borrowed bits
```

---

# 🔹 NUMBER OF HOSTS

```text
2^h - 2
```

Where:
```text
h = host bits
```

---

# 📘 SUPERNETTING

Supernetting combines multiple smaller networks into one larger network.

Opposite of subnetting.

---

# 📌 WHY SUPERNETTING?

- Reduces routing table size
- Improves routing efficiency

---

# 📌 EXAMPLE

Combine:
```text
192.168.0.0/24
192.168.1.0/24
```

Into:
```text
192.168.0.0/23
```

---

# 📘 ROUTING

---

# 📌 WHAT IS ROUTING?

Routing is the process of finding best path from source to destination.

Routers perform routing.

---

# 📌 ROUTER

Router is a Layer 3 device.

Uses:
```text
IP addresses
```

to forward packets.

---

# 📌 ROUTING PROCESS

```text
Packet Arrives
      ↓
Check Destination IP
      ↓
Find Best Route
      ↓
Forward Packet
```

---

# 📘 ROUTING ALGORITHMS

Routing algorithms determine best path.

---

# 📌 TYPES OF ROUTING ALGORITHMS

```text
Routing Algorithms
│
├── Distance Vector
└── Link State
```

---

# 📘 DISTANCE VECTOR ROUTING

Each router shares routing table with neighbors.

---

# 📌 MAIN IDEA

```text
Router knows:
- Distance
- Direction
```

---

# 📌 ALGORITHM USED

```text
Bellman-Ford Algorithm
```

---

# 📌 WORKING

1. Router sends routing table to neighbors
2. Neighbor updates its own table
3. Process repeats

---

# 📌 METRIC

Usually:
```text
Hop Count
```

---

# 📌 ADVANTAGES

- Simple
- Easy implementation

---

# 📌 DISADVANTAGES

- Slow convergence
- Routing loops possible

---

# 📌 COUNT TO INFINITY PROBLEM

Routers continuously increase metric value because of incorrect updates.

---

# 📌 SOLUTIONS

- Split Horizon
- Poison Reverse

---

# 📘 LINK STATE ROUTING

Each router builds complete map of network.

---

# 📌 ALGORITHM USED

```text
Dijkstra Algorithm
```

---

# 📌 WORKING

1. Discover neighbors
2. Measure link cost
3. Flood information
4. Build network graph
5. Calculate shortest path

---

# 📌 ADVANTAGES

- Fast convergence
- Accurate routing

---

# 📌 DISADVANTAGES

- Complex
- Requires more memory

---

# 📌 DISTANCE VECTOR VS LINK STATE

| Distance Vector | Link State |
|---|---|
| Shares routing table | Shares link information |
| Slow convergence | Fast convergence |
| Simple | Complex |
| Bellman-Ford | Dijkstra |

---

# 📘 ROUTING PROTOCOLS

Routing protocols define rules for routing.

---

# 📌 TYPES OF ROUTING PROTOCOLS

```text
Routing Protocols
│
├── RIP
├── OSPF
└── BGP
```

---

# 📘 RIP (ROUTING INFORMATION PROTOCOL)

RIP uses:
```text
Distance Vector Routing
```

---

# 📌 FEATURES OF RIP

| Feature | Value |
|---|---|
| Metric | Hop Count |
| Max Hops | 15 |
| Algorithm | Bellman-Ford |
| Port | UDP 520 |

---

# 📌 ADVANTAGES

- Simple
- Easy configuration

---

# 📌 DISADVANTAGES

- Slow
- Limited scalability

---

# 📘 OSPF (OPEN SHORTEST PATH FIRST)

OSPF uses:
```text
Link State Routing
```

---

# 📌 FEATURES OF OSPF

| Feature | Value |
|---|---|
| Algorithm | Dijkstra |
| Metric | Cost |
| Convergence | Fast |

---

# 📌 ADVANTAGES

- Fast routing
- Scalable
- Efficient

---

# 📌 DISADVANTAGES

- Complex configuration

---

# 📘 BGP (BORDER GATEWAY PROTOCOL)

BGP is used between autonomous systems on the Internet.

---

# 📌 USED BY

- ISPs
- Internet backbone

---

# 📌 FEATURES

| Feature | Value |
|---|---|
| Type | Path Vector |
| Protocol | TCP |
| Port | 179 |

---

# 📌 ADVANTAGES

- Internet-scale routing
- Highly scalable

---

# 📌 DISADVANTAGES

- Complex
- Slower convergence

---

# 📘 CONGESTION CONTROL

Congestion occurs when:
```text
Network traffic > Network capacity
```

---

# 📌 EFFECTS OF CONGESTION

- Packet loss
- Delay
- Reduced performance

---

# 📌 REAL LIFE ANALOGY

Too many vehicles on road:
```text
Traffic Jam
```

Similarly:
```text
Too many packets in network = Congestion
```

---

# 📌 CAUSES OF CONGESTION

- High traffic
- Slow routers
- Limited bandwidth
- Burst traffic

---

# 📌 CONGESTION CONTROL METHODS

```text
Congestion Control
│
├── Open Loop
└── Closed Loop
```

---

# 📘 OPEN LOOP CONGESTION CONTROL

Prevention-based approach.

---

# 📌 TECHNIQUES

- Retransmission policy
- Window policy
- Acknowledgment policy

---

# 📘 CLOSED LOOP CONGESTION CONTROL

Detects congestion and reacts dynamically.

---

# 📌 TECHNIQUES

- Backpressure
- Choke packets
- Load shedding

---

# 📌 TRAFFIC SHAPING

Controls traffic rate.

---

# 📌 LEAKY BUCKET ALGORITHM

Traffic exits at constant rate.

---

# 📌 TOKEN BUCKET ALGORITHM

Tokens generated over time.

Packets transmitted only if token available.

---

# 📌 LEAKY BUCKET VS TOKEN BUCKET

| Leaky Bucket | Token Bucket |
|---|---|
| Constant output | Variable output |
| Smooth traffic | Allows burst traffic |

---

# 📌 IMPORTANT DIFFERENCES

---

# 🔹 IPv4 VS IPv6

| IPv4 | IPv6 |
|---|---|
| 32-bit | 128-bit |
| Decimal | Hexadecimal |
| Limited addresses | Huge address space |

---

# 🔹 RIP VS OSPF

| RIP | OSPF |
|---|---|
| Distance Vector | Link State |
| Slow | Fast |
| Small networks | Large networks |

---

# 📌 IMPORTANT FORMULAS

---

# 🔹 NUMBER OF SUBNETS

```text
2^n
```

---

# 🔹 NUMBER OF HOSTS

```text
2^h - 2
```

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ IPv4 vs IPv6  
⭐ Classes of IPv4  
⭐ Subnetting Numericals  
⭐ CIDR Notation  
⭐ Distance Vector Routing  
⭐ Link State Routing  
⭐ RIP vs OSPF  
⭐ Congestion Control  
⭐ Token Bucket Algorithm  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is the role of Network Layer?

Provides logical addressing and routing.

---

## Q2. Difference between IPv4 and IPv6?

IPv4 uses 32-bit addressing while IPv6 uses 128-bit addressing.

---

## Q3. What is subnetting?

Dividing large network into smaller subnetworks.

---

## Q4. Difference between Distance Vector and Link State routing?

Distance Vector shares routing tables while Link State shares network topology.

---

## Q5. What is congestion?

Condition where network traffic exceeds network capacity.

---

# 📌 LAST MINUTE REVISION

```text
Network Layer
│
├── IP Addressing
│   ├── IPv4
│   └── IPv6
│
├── Subnetting
├── Supernetting
│
├── Routing
│   ├── Distance Vector
│   └── Link State
│
├── Routing Protocols
│   ├── RIP
│   ├── OSPF
│   └── BGP
│
└── Congestion Control
    ├── Leaky Bucket
    └── Token Bucket
```

---