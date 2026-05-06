# 📘 TRANSPORT LAYER (LAYER 4)

---

# 📌 INTRODUCTION TO TRANSPORT LAYER

The Transport Layer is the **4th layer** of the OSI Model.

It provides:

- End-to-end communication
- Reliable data delivery
- Flow control
- Error recovery
- Congestion control
- Process-to-process communication

The Network Layer only delivers packets between devices.

The Transport Layer ensures:

```text
"Data reaches the correct application correctly and reliably."
```

---

# 📌 POSITION OF TRANSPORT LAYER IN OSI MODEL

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
| 3. Network        |
+-------------------+
| 2. Data Link      |
+-------------------+
| 1. Physical Layer |
+-------------------+
```

---

# 📌 MAIN FUNCTIONS OF TRANSPORT LAYER

| Function | Description |
|---|---|
| Segmentation | Divides data into segments |
| Reliability | Ensures correct delivery |
| Flow Control | Controls sender speed |
| Error Recovery | Retransmits lost data |
| Multiplexing | Supports multiple applications |
| Congestion Control | Prevents network overload |

---

# 📌 REAL LIFE ANALOGY

Suppose a company sends important documents through courier service.

| Networking Concept | Real Life Example |
|---|---|
| Data | Documents |
| Segment | Small packets |
| TCP | Secure courier service |
| UDP | Normal postal service |
| Port Number | Department number |
| ACK | Delivery confirmation |

Transport Layer acts like:
```text
Reliable delivery management system
```

---

# 📘 PROCESS-TO-PROCESS COMMUNICATION

Transport Layer enables communication between:
- Applications
- Processes

Example:
- Browser ↔ Web Server
- Email Client ↔ Mail Server

---

# 📌 DATA UNIT OF TRANSPORT LAYER

```text
Segment
```

---

# 📘 SEGMENTATION

Large data is divided into smaller pieces called segments.

---

# 📌 WHY SEGMENTATION IS NEEDED?

Large data cannot be transmitted efficiently at once.

Advantages:
- Faster transmission
- Easy error recovery
- Better reliability

---

# 📌 EXAMPLE

Suppose:
```text
10 MB file
```

Transport Layer divides it into:
```text
Small segments
```

---

# 📘 TRANSPORT LAYER PROTOCOLS

```text
Transport Layer Protocols
│
├── TCP
└── UDP
```

---

# 📘 TCP (TRANSMISSION CONTROL PROTOCOL)

TCP is a:
```text
Connection-oriented and reliable protocol
```

It ensures:
- Correct delivery
- Ordered delivery
- Error-free communication

---

# 📌 FEATURES OF TCP

| Feature | Description |
|---|---|
| Reliable | Ensures delivery |
| Connection-Oriented | Connection established first |
| Error Checking | Detects errors |
| Ordered Delivery | Maintains sequence |
| Flow Control | Prevents overflow |
| Congestion Control | Controls traffic |

---

# 📌 TCP WORKING OVERVIEW

```text
1. Establish Connection
2. Send Data
3. Receive ACK
4. Retransmit if needed
5. Close Connection
```

---

# 📌 TCP HEADER

```text
+-----------------------------+
| Source Port                 |
+-----------------------------+
| Destination Port            |
+-----------------------------+
| Sequence Number             |
+-----------------------------+
| Acknowledgment Number       |
+-----------------------------+
| Flags                       |
+-----------------------------+
| Window Size                 |
+-----------------------------+
| Checksum                    |
+-----------------------------+
```

---

# 📘 TCP CONNECTION ESTABLISHMENT

TCP uses:
```text
Three-Way Handshake
```

to establish connection.

---

# 📌 THREE-WAY HANDSHAKE

---

# 🔹 STEP 1 — SYN

Client sends:
```text
SYN
```

Meaning:
```text
"I want to establish connection."
```

---

# 🔹 STEP 2 — SYN + ACK

Server replies:
```text
SYN + ACK
```

Meaning:
```text
"Connection request accepted."
```

---

# 🔹 STEP 3 — ACK

Client sends:
```text
ACK
```

Connection established.

---

# 📌 FLOW DIAGRAM

```text
Client                     Server

  SYN  -------------------->

       <------------------- SYN + ACK

  ACK  -------------------->
```

---

# 📘 TCP CONNECTION TERMINATION

TCP closes connection using:
```text
Four-Way Handshake
```

---

# 📌 STEPS

```text
FIN → ACK → FIN → ACK
```

---

# 📘 RELIABILITY IN TCP

TCP guarantees reliable delivery using:

```text
Reliability Mechanisms
│
├── Sequence Numbers
├── ACKs
├── Retransmission
├── Timers
└── Checksums
```

---

# 📌 1. SEQUENCE NUMBER

Each segment gets unique sequence number.

Receiver uses it to:
- Maintain order
- Detect missing data

---

# 📌 EXAMPLE

```text
Segment 1 → Seq = 100
Segment 2 → Seq = 200
Segment 3 → Seq = 300
```

---

# 📌 2. ACKNOWLEDGMENT

Receiver sends ACK after receiving data.

---

# 📌 EXAMPLE

```text
ACK = 301
```

Means:
```text
"Data till 300 received successfully."
```

---

# 📌 3. RETRANSMISSION

If ACK not received:
- Sender retransmits segment.

---

# 📌 4. CHECKSUM

Used for error detection.

Receiver verifies:
```text
Data integrity
```

---

# 📘 UDP (USER DATAGRAM PROTOCOL)

UDP is a:
```text
Connectionless and unreliable protocol
```

It does NOT guarantee:
- Delivery
- Ordering
- Reliability

---

# 📌 FEATURES OF UDP

| Feature | Description |
|---|---|
| Fast | No connection overhead |
| Connectionless | No setup required |
| Unreliable | Delivery not guaranteed |
| Lightweight | Small header |
| No ACK | Faster transmission |

---

# 📌 UDP HEADER

```text
+------------------+
| Source Port      |
+------------------+
| Destination Port |
+------------------+
| Length           |
+------------------+
| Checksum         |
+------------------+
```

---

# 📌 WHY UDP IS FAST?

UDP avoids:
- Handshakes
- ACKs
- Retransmissions

---

# 📌 APPLICATIONS OF UDP

| Application | Reason |
|---|---|
| Video Streaming | Speed important |
| Online Gaming | Real-time communication |
| DNS | Quick responses |
| VoIP | Low delay needed |

---

# 📌 TCP VS UDP

| TCP | UDP |
|---|---|
| Reliable | Unreliable |
| Connection-oriented | Connectionless |
| Slow | Fast |
| Ordered delivery | No ordering |
| ACK required | No ACK |
| Large header | Small header |

---

# 📘 PORT NUMBERS

Port numbers identify applications/processes.

---

# 📌 WHY PORTS ARE NEEDED?

One computer may run:
- Browser
- Email
- FTP
- Games

Ports identify:
```text
Which application should receive data?
```

---

# 📌 EXAMPLE

```text
IP Address → House Address
Port Number → Room Number
```

---

# 📌 PORT NUMBER RANGE

| Range | Type |
|---|---|
| 0 – 1023 | Well Known Ports |
| 1024 – 49151 | Registered Ports |
| 49152 – 65535 | Dynamic Ports |

---

# 📌 IMPORTANT WELL-KNOWN PORTS

| Protocol | Port |
|---|---|
| HTTP | 80 |
| HTTPS | 443 |
| FTP | 21 |
| SSH | 22 |
| Telnet | 23 |
| SMTP | 25 |
| DNS | 53 |

---

# 📘 FLOW CONTROL

Flow control prevents sender from overwhelming receiver.

---

# 📌 PROBLEM WITHOUT FLOW CONTROL

Fast sender:
```text
1000 packets/sec
```

Slow receiver:
```text
100 packets/sec
```

Result:
- Buffer overflow
- Packet loss

---

# 📌 FLOW CONTROL GOAL

```text
Sender Speed ≤ Receiver Capacity
```

---

# 📘 FLOW CONTROL METHODS

```text
Flow Control
│
├── Stop and Wait
└── Sliding Window
```

---

# 📘 STOP AND WAIT

Sender sends one segment and waits for ACK.

---

# 📌 WORKING

```text
Send Segment
      ↓
Wait for ACK
      ↓
ACK Received?
   /      \
 Yes       No
 ↓          ↓
Next      Retransmit
Segment
```

---

# 📌 ADVANTAGES

- Simple
- Reliable

---

# 📌 DISADVANTAGES

- Slow
- Poor efficiency

---

# 📘 SLIDING WINDOW PROTOCOL

Allows sender to send multiple segments before receiving ACK.

---

# 📌 CONCEPT OF WINDOW

Window = number of segments allowed without ACK.

---

# 📌 EXAMPLE

Window Size:
```text
4
```

Sender can send:
```text
Segment 1,2,3,4
```

without waiting.

---

# 📌 ADVANTAGES

- Faster communication
- Better bandwidth usage

---

# 📌 DISADVANTAGES

- More complex

---

# 📌 STOP & WAIT VS SLIDING WINDOW

| Stop & Wait | Sliding Window |
|---|---|
| One segment at a time | Multiple segments |
| Slow | Fast |
| Simple | Complex |
| Low efficiency | High efficiency |

---

# 📘 CONGESTION CONTROL

Congestion occurs when:
```text
Traffic > Network Capacity
```

Result:
- Packet loss
- Delay
- Reduced performance

---

# 📌 DIFFERENCE BETWEEN FLOW CONTROL & CONGESTION CONTROL

| Flow Control | Congestion Control |
|---|---|
| Sender vs Receiver | Entire network |
| Prevents receiver overload | Prevents network overload |

---

# 📘 TCP CONGESTION CONTROL

TCP controls congestion using:
- Congestion Window (cwnd)
- Slow Start
- Congestion Avoidance

---

# 📌 IMPORTANT TERMS

| Term | Meaning |
|---|---|
| cwnd | Congestion Window |
| ssthresh | Slow Start Threshold |
| RTT | Round Trip Time |

---

# 📘 TCP TAHOE

TCP Tahoe was one of earliest congestion control algorithms.

---

# 📌 FEATURES OF TAHOE

```text
Tahoe Uses:
│
├── Slow Start
├── Congestion Avoidance
└── Fast Retransmit
```

---

# 📌 WORKING OF TAHOE

When congestion detected:
```text
cwnd = 1
```

Transmission starts slowly again.

---

# 📌 ADVANTAGE

- Simple
- Stable

---

# 📌 DISADVANTAGE

- Performance drops heavily after congestion

---

# 📘 TCP RENO

Improved version of Tahoe.

---

# 📌 FEATURES OF RENO

```text
Reno Uses:
│
├── Slow Start
├── Congestion Avoidance
├── Fast Retransmit
└── Fast Recovery
```

---

# 📌 MAIN IMPROVEMENT

Instead of reducing:
```text
cwnd → 1
```

Reno reduces it partially.

Thus:
- Faster recovery
- Better performance

---

# 📌 TCP TAHOE VS RENO

| Tahoe | Reno |
|---|---|
| cwnd reset to 1 | Partial reduction |
| Slower recovery | Faster recovery |
| Older | Improved version |

---

# 📘 SLOW START

Initially:
```text
Small congestion window
```

Then increases exponentially.

---

# 📌 EXAMPLE

```text
1 → 2 → 4 → 8 → 16
```

---

# 📘 CONGESTION AVOIDANCE

After threshold:
```text
Increase slowly
```

---

# 📌 EXAMPLE

```text
16 → 17 → 18 → 19
```

---

# 📘 FAST RETRANSMIT

If sender receives:
```text
3 duplicate ACKs
```

It retransmits segment immediately.

---

# 📘 FAST RECOVERY

TCP Reno avoids returning to:
```text
cwnd = 1
```

This improves performance.

---

# 📌 IMPORTANT DIFFERENCES

---

# 🔹 TCP VS UDP

| TCP | UDP |
|---|---|
| Reliable | Unreliable |
| Connection-oriented | Connectionless |
| Slow | Fast |
| ACK required | No ACK |
| Ordered delivery | No ordering |

---

# 🔹 FLOW CONTROL VS CONGESTION CONTROL

| Flow Control | Congestion Control |
|---|---|
| Receiver protection | Network protection |
| End-to-end | Entire network |

---

# 📌 IMPORTANT FORMULAS

---

# 🔹 TCP THROUGHPUT

```text
Throughput = Window Size / RTT
```

---

# 🔹 EFFICIENCY OF STOP & WAIT

```text
Efficiency = Transmission Time / Total Time
```

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ TCP vs UDP  
⭐ Three-Way Handshake  
⭐ TCP Reliability  
⭐ Port Numbers  
⭐ Sliding Window  
⭐ Flow Control  
⭐ Congestion Control  
⭐ TCP Tahoe vs Reno  
⭐ Slow Start  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is the role of Transport Layer?

Provides end-to-end reliable communication.

---

## Q2. Difference between TCP and UDP?

TCP is reliable while UDP is fast but unreliable.

---

## Q3. What is a port number?

Logical identifier for application/process.

---

## Q4. What is Three-Way Handshake?

TCP connection establishment process.

---

## Q5. Difference between Flow Control and Congestion Control?

Flow control protects receiver while congestion control protects network.

---

# 📌 LAST MINUTE REVISION

```text
Transport Layer
│
├── TCP
│   ├── Reliable
│   ├── Connection-Oriented
│   ├── ACK
│   └── Handshake
│
├── UDP
│   ├── Fast
│   ├── Connectionless
│   └── No ACK
│
├── Port Numbers
│
├── Flow Control
│   ├── Stop & Wait
│   └── Sliding Window
│
└── Congestion Control
    ├── Tahoe
    ├── Reno
    ├── Slow Start
    └── Fast Recovery
```