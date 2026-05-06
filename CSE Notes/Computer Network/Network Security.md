# 📘 COMPUTER NETWORK SECURITY

---

# 📌 INTRODUCTION TO COMPUTER NETWORK SECURITY

Computer Network Security is the process of:
- Protecting networks
- Securing data
- Preventing unauthorized access
- Detecting attacks
- Ensuring safe communication

The main goal is:
```text
Protect data and network resources from threats and attacks.
```

---

# 📌 WHY NETWORK SECURITY IS IMPORTANT?

Without security:
- Hackers can steal data
- Systems can be damaged
- Privacy can be violated
- Services may stop working

---

# 📌 REAL LIFE ANALOGY

Suppose a bank protects:
- Money
- Customers
- Vaults

using:
- Locks
- Guards
- CCTV
- Authentication

Similarly, Network Security protects:
- Data
- Devices
- Servers
- Communication

---

# 📌 MAIN GOALS OF NETWORK SECURITY

Network security mainly focuses on:

```text
CIA TRIAD
│
├── Confidentiality
├── Integrity
└── Availability
```

---

# 📘 1. CONFIDENTIALITY

Confidentiality ensures:
```text
Only authorized users can access data.
```

---

# 📌 EXAMPLE

- Password-protected accounts
- Encrypted communication

---

# 📘 2. INTEGRITY

Integrity ensures:
```text
Data is not modified illegally.
```

---

# 📌 EXAMPLE

Original:
```text
₹1000
```

Modified:
```text
₹9000
```

Integrity mechanisms prevent this.

---

# 📘 3. AVAILABILITY

Availability ensures:
```text
Services remain accessible.
```

---

# 📌 EXAMPLE

- Banking servers should remain online
- Websites should be available 24/7

---

# 📌 TYPES OF SECURITY THREATS

```text
Security Threats
│
├── Passive Attacks
└── Active Attacks
```

---

# 📘 PASSIVE ATTACKS

Attacker only observes communication.

No modification performed.

---

# 📌 EXAMPLES

- Eavesdropping
- Traffic analysis

---

# 📌 DANGER

Very difficult to detect.

---

# 📘 ACTIVE ATTACKS

Attacker modifies or disrupts communication.

---

# 📌 EXAMPLES

- Data modification
- DoS attacks
- Replay attacks

---

# 📘 TYPES OF NETWORK ATTACKS

```text
Network Attacks
│
├── Malware
├── Phishing
├── DoS
├── DDoS
├── MITM
├── Spoofing
├── SQL Injection
├── XSS
└── Password Attacks
```

---

# 📘 MALWARE

Malware = Malicious Software

Designed to:
- Damage systems
- Steal information
- Disrupt services

---

# 📌 TYPES OF MALWARE

```text
Malware
│
├── Virus
├── Worm
├── Trojan
├── Ransomware
└── Spyware
```

---

# 📘 VIRUS

Attaches itself to legitimate files.

Requires user action to spread.

---

# 📌 EFFECTS

- Corrupt files
- Slow system
- Delete data

---

# 📘 WORM

Self-replicating malware.

Spreads automatically through network.

---

# 📌 DANGER

Consumes:
- Network bandwidth
- System resources

---

# 📘 TROJAN HORSE

Malware disguised as legitimate software.

---

# 📌 EXAMPLE

Fake:
```text
Game / Software Installer
```

containing malware.

---

# 📘 RANSOMWARE

Encrypts victim’s files.

Attacker demands ransom payment.

---

# 📌 EXAMPLE

```text
"Pay money to unlock files"
```

---

# 📘 SPYWARE

Secretly monitors user activities.

---

# 📌 COLLECTS

- Passwords
- Browsing history
- Banking details

---

# 📘 PHISHING

Attacker creates fake:
- Websites
- Emails
- Login pages

to steal sensitive information.

---

# 📌 EXAMPLE

Fake bank email:
```text
"Your account is blocked. Login now."
```

---

# 📘 DENIAL OF SERVICE (DoS)

Attacker floods system with requests.

Goal:
```text
Make service unavailable
```

---

# 📘 DDoS (DISTRIBUTED DENIAL OF SERVICE)

Multiple systems attack target simultaneously.

---

# 📌 EFFECTS

- Server crash
- Slow network
- Website downtime

---

# 📘 MAN-IN-THE-MIDDLE (MITM) ATTACK

Attacker secretly intercepts communication.

---

# 📌 FLOW

```text
Client ↔ Attacker ↔ Server
```

---

# 📌 DANGER

Attacker can:
- Read messages
- Modify communication

---

# 📘 SPOOFING

Spoofing means:
```text
Pretending to be another device/user
```

---

# 📌 TYPES

| Type | Description |
|---|---|
| IP Spoofing | Fake IP address |
| Email Spoofing | Fake email sender |
| MAC Spoofing | Fake MAC address |

---

# 📘 SQL INJECTION

Attacker injects malicious SQL commands into database queries.

---

# 📌 EXAMPLE

```sql
' OR '1'='1
```

---

# 📌 EFFECTS

- Data theft
- Unauthorized login
- Database manipulation

---

# 📘 XSS (CROSS SITE SCRIPTING)

Attacker injects malicious JavaScript into webpages.

---

# 📌 EFFECTS

- Cookie theft
- Session hijacking

---

# 📘 PASSWORD ATTACKS

Attackers try to crack passwords.

---

# 📌 TYPES

| Attack | Description |
|---|---|
| Brute Force | Tries all combinations |
| Dictionary Attack | Uses common passwords |
| Credential Stuffing | Uses leaked passwords |

---

# 📘 CRYPTOGRAPHY

Cryptography secures communication using mathematical techniques.

---

# 📌 GOALS OF CRYPTOGRAPHY

| Goal | Purpose |
|---|---|
| Confidentiality | Keep data secret |
| Integrity | Prevent modification |
| Authentication | Verify identity |
| Non-Repudiation | Prevent denial |

---

# 📘 BASIC TERMINOLOGIES

| Term | Meaning |
|---|---|
| Plain Text | Original data |
| Cipher Text | Encrypted data |
| Encryption | Converting readable → unreadable |
| Decryption | Converting unreadable → readable |
| Key | Secret value used in encryption |

---

# 📌 ENCRYPTION PROCESS

```text
Plain Text
     ↓
Encryption Algorithm
     ↓
Cipher Text
```

---

# 📌 DECRYPTION PROCESS

```text
Cipher Text
      ↓
Decryption Algorithm
      ↓
Original Data
```

---

# 📘 TYPES OF CRYPTOGRAPHY

```text
Cryptography
│
├── Symmetric Key Cryptography
└── Asymmetric Key Cryptography
```

---

# 📘 SYMMETRIC KEY CRYPTOGRAPHY

Same key used for:
- Encryption
- Decryption

---

# 📌 PROCESS

```text
Sender ↔ Same Secret Key ↔ Receiver
```

---

# 📌 ADVANTAGES

- Fast
- Efficient

---

# 📌 DISADVANTAGES

- Key sharing problem

---

# 📌 COMMON ALGORITHMS

| Algorithm | Description |
|---|---|
| DES | Old encryption standard |
| AES | Modern secure encryption |

---

# 📘 AES (ADVANCED ENCRYPTION STANDARD)

Most widely used encryption algorithm.

---

# 📌 FEATURES

| Feature | Value |
|---|---|
| Key Size | 128/192/256 bits |
| Security | Very High |
| Speed | Fast |

---

# 📘 ASYMMETRIC KEY CRYPTOGRAPHY

Uses two keys:
- Public Key
- Private Key

---

# 📌 PROCESS

```text
Public Key → Encrypt
Private Key → Decrypt
```

---

# 📌 ADVANTAGES

- Secure key exchange
- Better security

---

# 📌 DISADVANTAGES

- Slower than symmetric encryption

---

# 📌 COMMON ALGORITHMS

| Algorithm | Description |
|---|---|
| RSA | Popular public-key algorithm |
| ECC | Efficient modern algorithm |

---

# 📘 RSA ALGORITHM

RSA is widely used for:
- Secure communication
- Digital signatures

Named after:
```text
Rivest, Shamir, Adleman
```

---

# 📘 HASHING

Hashing converts data into fixed-size value.

---

# 📌 FEATURES

- One-way function
- Cannot easily reverse original data

---

# 📌 EXAMPLE

```text
Password → Hash Value
```

---

# 📌 COMMON HASHING ALGORITHMS

| Algorithm | Description |
|---|---|
| MD5 | Older algorithm |
| SHA-1 | Improved version |
| SHA-256 | Secure modern hashing |

---

# 📘 DIGITAL SIGNATURE

Digital signature verifies:
- Sender identity
- Data integrity

---

# 📌 PURPOSES

| Purpose | Description |
|---|---|
| Authentication | Verify sender |
| Integrity | Verify data |
| Non-Repudiation | Sender cannot deny |

---

# 📌 WORKING

```text
1. Sender creates hash
2. Encrypts hash with private key
3. Receiver decrypts using public key
4. Hash verified
```

---

# 📘 AUTHENTICATION

Authentication verifies:
```text
"Who are you?"
```

---

# 📌 TYPES OF AUTHENTICATION

```text
Authentication
│
├── Password-Based
├── OTP
├── Biometrics
└── Multi-Factor Authentication
```

---

# 📘 PASSWORD-BASED AUTHENTICATION

Uses:
- Username
- Password

---

# 📘 OTP (ONE TIME PASSWORD)

Temporary password valid for short duration.

---

# 📘 BIOMETRIC AUTHENTICATION

Uses biological characteristics.

---

# 📌 EXAMPLES

- Fingerprint
- Face recognition
- Iris scan

---

# 📘 MULTI-FACTOR AUTHENTICATION (MFA)

Uses multiple verification methods.

---

# 📌 EXAMPLE

```text
Password + OTP
```

---

# 📘 FIREWALL

Firewall monitors and filters network traffic.

Acts like:
```text
Security gate between trusted and untrusted networks.
```

---

# 📌 FIREWALL WORKING

```text
Incoming Traffic
       ↓
Firewall Rules
       ↓
Allow or Block
```

---

# 📘 TYPES OF FIREWALLS

```text
Firewalls
│
├── Packet Filtering Firewall
├── Stateful Firewall
├── Proxy Firewall
└── Next-Generation Firewall
```

---

# 📘 PACKET FILTERING FIREWALL

Filters packets based on:
- IP address
- Port number
- Protocol

---

# 📘 STATEFUL FIREWALL

Tracks active connections.

Smarter than packet filtering.

---

# 📘 PROXY FIREWALL

Acts as intermediary between client and server.

---

# 📘 NEXT-GENERATION FIREWALL (NGFW)

Advanced firewall with:
- Deep inspection
- Intrusion prevention
- Application awareness

---

# 📘 FIREWALL ADVANTAGES

- Prevent unauthorized access
- Traffic filtering
- Improved security

---

# 📘 VPN (VIRTUAL PRIVATE NETWORK)

VPN creates secure encrypted tunnel over public Internet.

---

# 📌 PURPOSE

Secure remote communication.

---

# 📌 WORKING

```text
User → Encrypted Tunnel → VPN Server → Internet
```

---

# 📌 BENEFITS

- Privacy
- Security
- Remote access

---

# 📘 TYPES OF VPN

| Type | Description |
|---|---|
| Remote Access VPN | Individual users |
| Site-to-Site VPN | Connects networks |

---

# 📘 SSL/TLS

SSL/TLS secures communication over Internet.

---

# 📌 FULL FORM

| Protocol | Full Form |
|---|---|
| SSL | Secure Sockets Layer |
| TLS | Transport Layer Security |

---

# 📌 USED IN

- HTTPS
- Banking websites
- Secure login systems

---

# 📌 SSL/TLS WORKING

```text
Client ↔ Server
       ↓
Encrypted Communication
```

---

# 📘 NETWORK SECURITY PROTOCOLS

---

# 📌 IMPORTANT SECURITY PROTOCOLS

| Protocol | Purpose |
|---|---|
| HTTPS | Secure web communication |
| SSH | Secure remote login |
| IPsec | Secure IP communication |
| SSL/TLS | Encryption |
| SFTP | Secure file transfer |

---

# 📘 IPsec (INTERNET PROTOCOL SECURITY)

IPsec secures communication at Network Layer.

Provides:
- Authentication
- Encryption
- Integrity

---

# 📘 SFTP (SECURE FILE TRANSFER PROTOCOL)

Secure version of FTP.

Uses:
```text
SSH Encryption
```

---

# 📘 IDS & IPS

---

# 📘 IDS (INTRUSION DETECTION SYSTEM)

Detects suspicious activities.

---

# 📌 TYPES

| Type | Description |
|---|---|
| Network IDS | Monitors network |
| Host IDS | Monitors device |

---

# 📘 IPS (INTRUSION PREVENTION SYSTEM)

Not only detects attacks:
```text
Also blocks them.
```

---

# 📘 ANTIVIRUS

Antivirus software detects and removes malware.

---

# 📌 FUNCTIONS

- Scan files
- Detect threats
- Remove malware

---

# 📘 SECURITY POLICIES

Organizations define rules for:
- Passwords
- Access control
- Data handling

---

# 📘 BACKUP & DISASTER RECOVERY

Security also includes:
- Data backup
- Recovery plans

---

# 📌 IMPORTANCE

Protects against:
- Data loss
- Ransomware
- Hardware failure

---

# 📘 IMPORTANT DIFFERENCES

---

# 🔹 SYMMETRIC VS ASYMMETRIC ENCRYPTION

| Symmetric | Asymmetric |
|---|---|
| One key | Two keys |
| Faster | Slower |
| Less secure sharing | Better security |

---

# 🔹 IDS VS IPS

| IDS | IPS |
|---|---|
| Detects attacks | Detects + blocks |
| Passive | Active |

---

# 🔹 SSL VS TLS

| SSL | TLS |
|---|---|
| Older | Newer |
| Less secure | More secure |

---

# 📌 ADVANTAGES OF NETWORK SECURITY

- Protects sensitive data
- Prevents attacks
- Ensures privacy
- Maintains availability

---

# 📌 DISADVANTAGES

- Expensive implementation
- Complexity
- Performance overhead

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ Cryptography  
⭐ AES vs RSA  
⭐ Digital Signature  
⭐ Firewall Types  
⭐ VPN  
⭐ SSL/TLS  
⭐ Malware Types  
⭐ Authentication Methods  
⭐ IDS vs IPS  
⭐ Network Attacks  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is Computer Network Security?

Protection of networks and data from unauthorized access and attacks.

---

## Q2. Difference between symmetric and asymmetric encryption?

Symmetric uses one key while asymmetric uses two keys.

---

## Q3. What is firewall?

A security system that filters network traffic.

---

## Q4. What is VPN?

Encrypted secure tunnel over Internet.

---

## Q5. Difference between IDS and IPS?

IDS detects attacks while IPS detects and blocks attacks.

---

# 📌 LAST MINUTE REVISION

```text
Computer Network Security
│
├── Cryptography
│   ├── Symmetric
│   ├── Asymmetric
│   └── Hashing
│
├── Authentication
│   ├── Password
│   ├── OTP
│   └── MFA
│
├── Firewalls
├── VPN
├── SSL/TLS
├── IDS / IPS
├── Digital Signatures
└── Network Attacks
```

---