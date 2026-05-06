# 📘 DATA LINK LAYER (LAYER 2)

---

# 📌 INTRODUCTION TO DATA LINK LAYER

The Data Link Layer is the **second layer** of the OSI Model.

It sits above the Physical Layer and provides:
- Reliable node-to-node communication
- Error detection
- Flow control
- Framing

The Physical Layer only transmits raw bits.

The Data Link Layer ensures:

```text
"Bits are delivered correctly between directly connected devices."
```

---

# 📌 POSITION OF DATA LINK LAYER IN OSI MODEL

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

# 📌 MAIN FUNCTIONS OF DATA LINK LAYER

The Data Link Layer performs several important functions.

---

# 🔹 FUNCTIONS OF DATA LINK LAYER

| Function | Description |
|---|---|
| Framing | Divides data into frames |
| Physical Addressing | Uses MAC addresses |
| Error Detection | Detects transmission errors |
| Error Correction | Corrects errors |
| Flow Control | Controls sender speed |
| Access Control | Controls medium access |

---

# 📌 REAL LIFE ANALOGY

Suppose two people are sending parcels.

| Networking Concept | Real Life Example |
|---|---|
| Data | Parcel |
| Frame | Packed parcel with label |
| MAC Address | House address |
| Error Detection | Checking damaged parcel |
| Flow Control | Controlling delivery speed |

The Data Link Layer acts like:
- Packaging
- Labeling
- Error checking
- Delivery coordination

---

# 📌 SUBLAYERS OF DATA LINK LAYER

The Data Link Layer has two sublayers.

```text
Data Link Layer
│
├── LLC (Logical Link Control)
│
└── MAC (Media Access Control)
```

---

# 🔹 1. LLC (Logical Link Control)

Responsible for:
- Error control
- Flow control

---

# 🔹 2. MAC (Media Access Control)

Responsible for:
- MAC addressing
- Channel access control

---

# 📘 FRAMING

---

# 📌 WHAT IS FRAMING?

Framing is the process of dividing data into smaller units called frames.

---

# 📌 WHY FRAMING IS NEEDED?

Suppose sender sends continuous stream:

```text
1010101111000011111010101010
```

Receiver cannot identify:
- Start of message
- End of message

Framing solves this problem.

---

# 📌 FRAME STRUCTURE

```text
+---------+----------+---------+----------+
| Header  | Payload  | Trailer | Checksum |
+---------+----------+---------+----------+
```

---

# 📌 COMPONENTS OF FRAME

| Component | Purpose |
|---|---|
| Header | Address information |
| Payload | Actual data |
| Trailer | Error checking |
| Checksum | Detect corruption |

---

# 📌 TYPES OF FRAMING

---

# 🔹 1. Character Count Method

Frame header contains length of frame.

---

## ❌ PROBLEM

If count becomes corrupted:
- Entire frame becomes invalid

---

# 🔹 2. Byte Stuffing

Special byte marks frame boundaries.

---

## 📌 EXAMPLE

```text
FLAG DATA FLAG
```

If FLAG appears inside data:
- Escape character inserted.

---

# 🔹 3. Bit Stuffing

Used in bit-oriented protocols.

Extra 0 inserted after five consecutive 1s.

---

## 📌 EXAMPLE

Original:
```text
111111
```

After bit stuffing:
```text
1111101
```

---

# 📘 ERROR DETECTION

During transmission, data may become corrupted because of:
- Noise
- Signal interference
- Hardware issues

Error detection identifies such errors.

---

# 📌 TYPES OF ERRORS

---

# 🔹 1. Single Bit Error

Only one bit changes.

---

## 📌 EXAMPLE

Original:
```text
1011001
```

Received:
```text
1001001
```

Only one bit changed.

---

# 🔹 2. Burst Error

Multiple consecutive bits change.

---

## 📌 EXAMPLE

Original:
```text
101111001
```

Received:
```text
100000001
```

Multiple bits corrupted.

---

# 📘 ERROR DETECTION METHODS

```text
Error Detection
│
├── Parity Check
├── Checksum
├── CRC
└── Hamming Code
```

---

# 📌 1. PARITY CHECK

Extra parity bit added.

---

# 🔹 EVEN PARITY

Number of 1s must be even.

---

## 📌 EXAMPLE

Data:
```text
1011001
```

Number of 1s:
```text
4
```

Already even.

Parity bit:
```text
0
```

Final:
```text
10110010
```

---

# 🔹 ODD PARITY

Number of 1s must be odd.

---

# 📌 ADVANTAGES

- Simple
- Low cost

---

# 📌 DISADVANTAGES

- Cannot detect multiple errors

---

# 📘 CRC (CYCLIC REDUNDANCY CHECK)

CRC is one of the most powerful error detection techniques.

Used in:
- Ethernet
- Wi-Fi
- Storage devices

---

# 📌 WORKING OF CRC

CRC uses:
- Binary division
- Generator polynomial

---

# 📌 BASIC STEPS

```text
1. Append zeros to data
2. Divide using generator
3. Remainder becomes CRC
4. Receiver performs same division
5. If remainder = 0 → No error
```

---

# 📌 SIMPLE EXAMPLE

Data:
```text
110101
```

Generator:
```text
1011
```

CRC remainder appended to frame.

---

# 📌 ADVANTAGES OF CRC

- Detects burst errors
- Highly reliable
- Widely used

---

# 📌 DISADVANTAGES

- More complex

---

# 📘 HAMMING CODE

Hamming Code can:
- Detect errors
- Correct single-bit errors

Developed by:
```text
Richard Hamming
```

---

# 📌 WHY HAMMING CODE?

Parity can only detect errors.

Hamming Code can:
```text
Detect + Correct
```

---

# 📌 PARITY BIT POSITIONS

Parity bits placed at powers of 2:

```text
1, 2, 4, 8, 16...
```

---

# 📌 EXAMPLE STRUCTURE

```text
P1 P2 D1 P4 D2 D3 D4
```

Where:
- P = Parity bit
- D = Data bit

---

# 📌 ADVANTAGES

- Error correction possible
- Reliable

---

# 📌 DISADVANTAGES

- More overhead

---

# 📘 FLOW CONTROL

Flow control prevents sender from sending data too fast.

Without flow control:
- Receiver buffer may overflow.

---

# 📌 REAL LIFE ANALOGY

Teacher speaking too fast:
- Students cannot understand.

Flow control ensures:
```text
Sender speed ≤ Receiver processing speed
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

# 📌 1. STOP AND WAIT PROTOCOL

Sender sends one frame at a time.

Then waits for acknowledgment (ACK).

---

# 📌 WORKING

```text
Sender → Frame → Receiver
Sender waits for ACK
ACK received → Next frame sent
```

---

# 📌 FLOWCHART

```text
Send Frame
     ↓
Wait for ACK
     ↓
ACK Received?
   /     \
 Yes      No
  ↓        ↓
Next     Resend
Frame    Frame
```

---

# 📌 ADVANTAGES

- Simple
- Easy implementation

---

# 📌 DISADVANTAGES

- Slow
- Poor bandwidth utilization

---

# 📘 2. SLIDING WINDOW PROTOCOL

Multiple frames sent before receiving ACK.

Improves efficiency.

---

# 📌 CONCEPT OF WINDOW

Window = number of frames sender can send without waiting.

---

# 📌 EXAMPLE

Window Size:
```text
4
```

Sender can send:
```text
Frame 1,2,3,4
```

before ACK arrives.

---

# 📌 ADVANTAGES

- Faster transmission
- Better bandwidth usage

---

# 📌 DISADVANTAGES

- Complex implementation

---

# 📌 STOP AND WAIT VS SLIDING WINDOW

| Feature | Stop & Wait | Sliding Window |
|---|---|---|
| Frames sent | One at a time | Multiple |
| Speed | Slow | Fast |
| Efficiency | Low | High |
| Complexity | Simple | Complex |

---

# 📘 MAC (MEDIA ACCESS CONTROL)

When multiple devices share same medium:
- Collision may occur.

MAC protocols control:
```text
Who can send data and when?
```

---

# 📘 MAC PROTOCOLS

```text
MAC Protocols
│
├── ALOHA
├── CSMA
└── CSMA/CD
```

---

# 📘 ALOHA

Developed for wireless communication.

---

# 🔹 PURE ALOHA

Device sends data whenever it wants.

---

# 📌 PROBLEM

Collision probability high.

---

# 📌 EFFICIENCY

```text
18.4%
```

---

# 🔹 SLOTTED ALOHA

Time divided into slots.

Devices transmit only at slot boundaries.

---

# 📌 ADVANTAGE

Fewer collisions than Pure ALOHA.

---

# 📌 EFFICIENCY

```text
36.8%
```

---

# 📘 CSMA (CARRIER SENSE MULTIPLE ACCESS)

Before transmitting:
- Device listens to channel.

---

# 📌 RULE

```text
If channel busy → Wait
If channel free → Send
```

---

# 📌 TYPES OF CSMA

| Type | Behavior |
|---|---|
| 1-Persistent | Send immediately |
| Non-Persistent | Wait randomly |
| p-Persistent | Probability based |

---

# 📘 CSMA/CD

Full form:

```text
Carrier Sense Multiple Access with Collision Detection
```

Used in traditional Ethernet.

---

# 📌 WORKING

```text
1. Listen to channel
2. If free → Transmit
3. Detect collision
4. Stop transmission
5. Wait random time
6. Retransmit
```

---

# 📌 FLOWCHART

```text
Listen Channel
      ↓
Channel Free?
   /      \
 Yes       No
 ↓          ↓
Transmit   Wait
 ↓
Collision?
 /      \
Yes      No
↓         ↓
Stop     Success
Wait
Retransmit
```

---

# 📌 ADVANTAGES

- Reduces collisions
- Efficient medium usage

---

# 📌 DISADVANTAGES

- Not suitable for wireless networks

---

# 📘 ETHERNET

Ethernet is the most widely used LAN technology.

Developed by:
```text
Xerox PARC
```

Standard:
```text
IEEE 802.3
```

---

# 📌 FEATURES OF ETHERNET

- Uses MAC addresses
- Uses frames
- Supports high speed
- Reliable communication

---

# 📌 ETHERNET FRAME FORMAT

```text
+------+-----+------+-------+------+
| Dest | Src | Type | Data  | CRC  |
+------+-----+------+-------+------+
```

---

# 📌 MAC ADDRESS

MAC Address is a physical hardware address.

Length:
```text
48 bits
```

Example:
```text
00:1A:2B:3C:4D:5E
```

---

# 📌 TYPES OF ETHERNET

| Ethernet Type | Speed |
|---|---|
| Standard Ethernet | 10 Mbps |
| Fast Ethernet | 100 Mbps |
| Gigabit Ethernet | 1 Gbps |
| 10 Gigabit Ethernet | 10 Gbps |

---

# 📘 SWITCHING

Switching allows data forwarding between devices.

---

# 📌 SWITCH

A switch is an intelligent networking device.

Works at:
```text
Data Link Layer
```

---

# 📌 FUNCTIONS OF SWITCH

- Learns MAC addresses
- Forwards frames
- Reduces collisions

---

# 📌 SWITCH WORKING

```text
Frame Arrives
      ↓
Read Destination MAC
      ↓
MAC Found?
   /      \
 Yes       No
 ↓          ↓
Forward    Broadcast
Frame
```

---

# 📌 ADVANTAGES OF SWITCH

- Faster communication
- Less collision
- Better performance

---

# 📘 BRIDGES

Bridge connects two LAN segments.

Works at:
```text
Data Link Layer
```

---

# 📌 FUNCTIONS OF BRIDGE

- Filters traffic
- Reduces unnecessary communication

---

# 📌 BRIDGE VS SWITCH

| Bridge | Switch |
|---|---|
| Fewer ports | Many ports |
| Slower | Faster |
| Less intelligent | More intelligent |

---

# 📌 IMPORTANT DIFFERENCES

---

# 🔹 HUB VS SWITCH

| Hub | Switch |
|---|---|
| Broadcasts data | Intelligent forwarding |
| More collisions | Fewer collisions |
| Slower | Faster |

---

# 🔹 SWITCH VS ROUTER

| Switch | Router |
|---|---|
| Uses MAC Address | Uses IP Address |
| Layer 2 | Layer 3 |
| Connects devices | Connects networks |

---

# 📌 IMPORTANT FORMULAS

---

# 🔹 HAMMING CODE FORMULA

```text
2^r ≥ m + r + 1
```

Where:
- r = parity bits
- m = data bits

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ Framing  
⭐ CRC  
⭐ Hamming Code  
⭐ Stop and Wait  
⭐ Sliding Window  
⭐ CSMA/CD  
⭐ Ethernet  
⭐ MAC Address  
⭐ Switch vs Hub  
⭐ Bridge vs Switch  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is the role of Data Link Layer?

Provides reliable node-to-node communication.

---

## Q2. What is framing?

Process of dividing data into frames.

---

## Q3. Difference between CRC and Hamming Code?

CRC detects errors while Hamming Code detects and corrects errors.

---

## Q4. What is MAC Address?

Physical hardware address of network device.

---

## Q5. Difference between Hub and Switch?

Hub broadcasts data while switch intelligently forwards frames.

---

# 📌 LAST MINUTE REVISION

```text
Data Link Layer
│
├── Framing
│
├── Error Detection
│   ├── Parity
│   ├── CRC
│   └── Hamming Code
│
├── Flow Control
│   ├── Stop & Wait
│   └── Sliding Window
│
├── MAC Protocols
│   ├── ALOHA
│   ├── CSMA
│   └── CSMA/CD
│
├── Ethernet
│
└── Switching
    ├── Bridge
    └── Switch
```

---