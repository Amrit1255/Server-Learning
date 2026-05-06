# 📘 PHYSICAL LAYER (LAYER 1)

---

# 📌 INTRODUCTION TO PHYSICAL LAYER

The Physical Layer is the first layer of the OSI Model.

It is responsible for the actual transmission of raw bits (0s and 1s) over a communication medium.

The Physical Layer deals with:
- Hardware
- Signals
- Transmission media
- Data transmission

---

# 📌 FUNCTIONS OF PHYSICAL LAYER

## 🔹 Main Functions

- Transmission of raw bits
- Defines electrical and mechanical specifications
- Signal conversion
- Data rate control
- Synchronization of bits
- Physical topology definition
- Transmission mode handling

---

# 📌 RESPONSIBILITIES OF PHYSICAL LAYER

| Responsibility | Description |
|---|---|
| Bit Transmission | Transfers bits |
| Synchronization | Sender and receiver timing |
| Data Rate Control | Controls transmission speed |
| Line Configuration | Point-to-point or multipoint |
| Physical Topology | Network arrangement |
| Transmission Mode | Simplex/Half Duplex/Full Duplex |

---

# 📌 TRANSMISSION MODES

---

## 🔹 1. Simplex Mode

Communication happens only in one direction.

### Example
- Keyboard → Computer
- TV Broadcast

### Characteristics
- Sender only sends
- Receiver only receives

---

## 🔹 2. Half Duplex Mode

Communication happens in both directions but not simultaneously.

### Example
- Walkie Talkie

### Characteristics
- One device sends at a time

---

## 🔹 3. Full Duplex Mode

Communication happens in both directions simultaneously.

### Example
- Mobile Phone Call

### Characteristics
- Both devices can send and receive together

---

# 📌 SIGNALS IN COMPUTER NETWORKS

A signal is an electromagnetic or electrical representation of data.

Signals carry information from sender to receiver.

---

# 📌 TYPES OF SIGNALS

---

## 🔹 1. Analog Signal

A continuous signal with infinite values.

### Characteristics
- Continuous waveform
- Noise sensitive
- Used in traditional communication

### Example
- Human voice
- Radio signals

---

## 🔹 2. Digital Signal

A discrete signal represented using binary values (0 and 1).

### Characteristics
- Less noise sensitive
- Easy to process
- Used in computers

### Example
- Computer data
- Digital electronics

---

# 📌 ANALOG VS DIGITAL SIGNAL

| Analog Signal | Digital Signal |
|---|---|
| Continuous | Discrete |
| Infinite values | Binary values |
| More noise sensitive | Less noise sensitive |
| Harder to process | Easier to process |

---

# 📌 SIGNAL CHARACTERISTICS

---

## 🔹 1. Amplitude

Represents strength of signal.

### Unit
Volt (V)

Higher amplitude means stronger signal.

---

## 🔹 2. Frequency

Number of cycles completed in one second.

### Unit
Hertz (Hz)

### Formula

```text
Frequency = 1 / Time Period
```

---

## 🔹 3. Time Period

Time required to complete one cycle.

### Formula

```text
T = 1 / f
```

Where:
- T = Time Period
- f = Frequency

---

## 🔹 4. Phase

Position of waveform relative to time.

Measured in degrees.

---

# 📌 BANDWIDTH

Bandwidth is the range of frequencies a communication channel can carry.

### Formula

```text
Bandwidth = Highest Frequency - Lowest Frequency
```

### Unit
Hertz (Hz)

Higher bandwidth means more data transfer capacity.

---

# 📌 DATA RATE

Data rate is the amount of data transmitted per second.

### Unit
bits per second (bps)

Examples:
- Kbps
- Mbps
- Gbps

---

# 📌 BIT RATE VS BAUD RATE

| Bit Rate | Baud Rate |
|---|---|
| Number of bits/sec | Number of signal units/sec |
| Measures data speed | Measures signal speed |

### Formula

```text
Bit Rate = Baud Rate × Number of Bits per Signal
```

---

# 📌 DIGITAL TRANSMISSION

Digital transmission means transfer of digital signals between devices.

---

# 📌 LINE CODING

Line coding converts digital data into digital signals.

---

## 🔹 TYPES OF LINE CODING

### 1. NRZ (Non Return to Zero)

- Simple encoding
- Signal does not return to zero

---

### 2. Manchester Encoding

- Transition occurs in middle of bit
- Better synchronization

---

### 3. Differential Manchester

- Uses transition for synchronization
- More reliable

---

# 📌 TRANSMISSION MEDIA

Transmission media is the physical path between sender and receiver.

---

# 📌 TYPES OF TRANSMISSION MEDIA

---

## 🔹 1. Guided Media (Wired Communication)

Data travels through physical cables.

### Types
- Twisted Pair Cable
- Coaxial Cable
- Optical Fiber Cable

---

## 🔹 2. Unguided Media (Wireless Communication)

Data travels through air.

### Types
- Radio Waves
- Microwaves
- Infrared

---

# 📘 GUIDED MEDIA

---

# 📌 1. TWISTED PAIR CABLE

Two insulated copper wires twisted together.

---

## 🔹 TYPES

### UTP (Unshielded Twisted Pair)
- Cheap
- Commonly used

### STP (Shielded Twisted Pair)
- Better noise protection

---

## 🔹 ADVANTAGES

- Low cost
- Easy installation
- Flexible

---

## 🔹 DISADVANTAGES

- More noise
- Lower speed

---

## 🔹 APPLICATIONS

- Telephone lines
- LAN networks

---

# 📌 2. COAXIAL CABLE

Contains:
- Inner conductor
- Insulation
- Metallic shield
- Outer cover

---

## 🔹 ADVANTAGES

- Better shielding
- Higher bandwidth than twisted pair

---

## 🔹 DISADVANTAGES

- More expensive
- Bulkier

---

## 🔹 APPLICATIONS

- Cable TV
- Broadband Internet

---

# 📌 3. OPTICAL FIBER CABLE

Uses light signals for communication.

---

## 🔹 TYPES OF OPTICAL FIBER

### 1. Single Mode Fiber
- Long distance
- High speed

### 2. Multi Mode Fiber
- Short distance
- Lower cost

---

## 🔹 ADVANTAGES

- Very high speed
- Long distance communication
- No electromagnetic interference
- Highly secure

---

## 🔹 DISADVANTAGES

- Expensive
- Difficult installation

---

## 🔹 APPLICATIONS

- Internet backbone
- High-speed communication
- Undersea cables

---

# 📌 COMPARISON OF GUIDED MEDIA

| Feature | Twisted Pair | Coaxial | Fiber Optic |
|---|---|---|---|
| Cost | Low | Medium | High |
| Speed | Low | Medium | Very High |
| Distance | Short | Medium | Long |
| Noise Resistance | Low | Medium | Very High |

---

# 📘 UNGUIDED MEDIA

---

# 📌 1. RADIO WAVES

- Omnidirectional
- No alignment required

---

## 🔹 APPLICATIONS

- Radio Broadcasting
- Wi-Fi

---

# 📌 2. MICROWAVES

- Directional communication
- Requires line of sight

---

## 🔹 APPLICATIONS

- Satellite Communication
- Mobile Towers

---

# 📌 3. INFRARED

- Short range communication
- Cannot penetrate walls

---

## 🔹 APPLICATIONS

- TV Remote
- Infrared Devices

---

# 📌 SWITCHING TECHNIQUES

Switching determines how data moves from source to destination.

---

# 📌 TYPES OF SWITCHING

---

## 🔹 1. Circuit Switching

A dedicated communication path is established before transmission.

### Example
Traditional telephone network

---

## 🔹 ADVANTAGES

- Reliable communication
- Fixed bandwidth

---

## 🔹 DISADVANTAGES

- Bandwidth wastage
- Expensive

---

# 📌 2. Packet Switching

Data is divided into packets.

Each packet may travel through different routes.

### Example
Internet

---

## 🔹 ADVANTAGES

- Efficient bandwidth usage
- Cost effective

---

## 🔹 DISADVANTAGES

- Delay possible
- Packet loss possible

---

# 📌 3. Message Switching

Entire message transferred node-to-node.

---

## 🔹 ADVANTAGES

- No dedicated path required

---

## 🔹 DISADVANTAGES

- High delay
- Large storage required

---

# 📌 MULTIPLEXING

Multiplexing allows multiple signals to share a single communication channel.

---

# 📌 TYPES OF MULTIPLEXING

---

## 🔹 1. FDM (Frequency Division Multiplexing)

Different frequencies used for different signals.

### Example
Radio Broadcasting

---

## 🔹 2. TDM (Time Division Multiplexing)

Different time slots assigned.

### Example
Digital communication systems

---

## 🔹 3. WDM (Wavelength Division Multiplexing)

Used in optical fiber communication.

### Example
Fiber optic communication

---

# 📌 PHYSICAL TOPOLOGIES

---

## 🔹 1. Bus Topology

Single backbone cable used.

### Advantages
- Simple
- Cheap

### Disadvantages
- Backbone failure affects whole network

---

## 🔹 2. Star Topology

All devices connected to central hub/switch.

### Advantages
- Easy management
- Fault isolation easy

### Disadvantages
- Hub failure affects network

---

## 🔹 3. Ring Topology

Devices connected in circular form.

### Advantages
- Predictable performance

### Disadvantages
- Failure affects network

---

## 🔹 4. Mesh Topology

Every device connected to every other device.

### Advantages
- Highly reliable

### Disadvantages
- Expensive

---

# 📌 IMPORTANT FORMULAS

---

## 🔹 Frequency Formula

```text
f = 1 / T
```

Where:
- f = Frequency
- T = Time Period

---

## 🔹 Time Period Formula

```text
T = 1 / f
```

---

## 🔹 Bandwidth Formula

```text
Bandwidth = Highest Frequency - Lowest Frequency
```

---

## 🔹 Bit Rate Formula

```text
Bit Rate = Baud Rate × Bits per Signal
```

---

# 📌 ADVANTAGES OF PHYSICAL LAYER

- Enables communication
- Defines hardware standards
- Supports data transmission
- Provides transmission medium

---

# 📌 DISADVANTAGES OF PHYSICAL LAYER

- No error correction
- No security
- No flow control

---

# 📌 COMMON INTERVIEW QUESTIONS

---

## Q1. What is the role of Physical Layer?

Physical Layer is responsible for transmission of raw bits through communication medium.

---

## Q2. Difference between Analog and Digital Signal?

Analog signals are continuous while digital signals are discrete.

---

## Q3. Which transmission medium provides highest speed?

Optical Fiber Cable.

---

## Q4. What is multiplexing?

Technique of combining multiple signals into one communication channel.

---

## Q5. Difference between Bit Rate and Baud Rate?

Bit rate measures bits/sec while baud rate measures signal units/sec.

---

# 📌 LAST MINUTE REVISION

---

## 🔹 Physical Layer Quick Summary

- Layer 1 of OSI Model
- Handles raw bit transmission
- Defines signals and media
- Analog and Digital signals
- Guided and Unguided media
- Switching techniques
- Multiplexing
- Transmission modes
- Topologies

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ Analog vs Digital Signal  
⭐ Guided vs Unguided Media  
⭐ Optical Fiber Cable  
⭐ Switching Techniques  
⭐ Multiplexing  
⭐ Transmission Modes  
⭐ Topologies  
⭐ Bandwidth Formula  
⭐ Bit Rate vs Baud Rate  

---

# 🚀 NEXT TOPIC

👉 DATA LINK LAYER (LAYER 2)

Topics Covered:
- Framing
- Error Detection
- CRC
- Hamming Code
- Flow Control
- Sliding Window
- Ethernet
- MAC Protocols
- Switching

---
