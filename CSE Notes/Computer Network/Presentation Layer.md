# 📘 PRESENTATION LAYER (LAYER 6)

---

# 📌 INTRODUCTION TO PRESENTATION LAYER

The Presentation Layer is the **6th layer** of the OSI Model.

It is responsible for:
- Data translation
- Data formatting
- Encryption
- Decryption
- Compression
- Decompression

The Presentation Layer acts like:
```text
Translator and formatter of network communication.
```

It ensures:
```text
Data sent by sender is understandable by receiver.
```

---

# 📌 POSITION OF PRESENTATION LAYER IN OSI MODEL

```text
+-----------------------+
| 7. Application Layer  |
+-----------------------+
| 6. Presentation Layer |
+-----------------------+
| 5. Session Layer      |
+-----------------------+
| 4. Transport Layer    |
+-----------------------+
| 3. Network Layer      |
+-----------------------+
| 2. Data Link Layer    |
+-----------------------+
| 1. Physical Layer     |
+-----------------------+
```

---

# 📌 MAIN PURPOSE OF PRESENTATION LAYER

Different systems may use:
- Different character formats
- Different encoding standards
- Different encryption methods

Presentation Layer ensures:
```text
All systems understand exchanged data correctly.
```

---

# 📌 REAL LIFE ANALOGY

Suppose:
- One person speaks Hindi
- Another speaks English

A translator is needed.

| Networking Concept | Real Life Example |
|---|---|
| Presentation Layer | Translator |
| Encryption | Secret language |
| Compression | Zip file |
| Formatting | Document styling |

Presentation Layer acts like:
```text
Translator + Security Officer + Data Formatter
```

---

# 📌 MAIN FUNCTIONS OF PRESENTATION LAYER

| Function | Description |
|---|---|
| Translation | Converts data formats |
| Encryption | Secures data |
| Decryption | Restores original data |
| Compression | Reduces data size |
| Decompression | Restores compressed data |
| Formatting | Standardizes representation |

---

# 📘 DATA TRANSLATION

Different computers use different:
- Character encoding systems
- Data formats

Presentation Layer converts data into standard format.

---

# 📌 EXAMPLE

Suppose:
- One system uses ASCII
- Another uses Unicode

Presentation Layer performs:
```text
ASCII ↔ Unicode conversion
```

---

# 📘 CHARACTER ENCODING

Character encoding defines how characters are represented in binary.

---

# 📌 COMMON ENCODING STANDARDS

| Encoding | Description |
|---|---|
| ASCII | 7-bit encoding |
| Unicode | Universal encoding |
| UTF-8 | Variable length Unicode |

---

# 📌 ASCII

ASCII stands for:
```text
American Standard Code for Information Interchange
```

---

# 📌 FEATURES OF ASCII

| Feature | Value |
|---|---|
| Size | 7-bit |
| Characters | 128 |
| Used For | English characters |

---

# 📌 EXAMPLE

Character:
```text
A
```

ASCII Binary:
```text
1000001
```

---

# 📘 UNICODE

Unicode supports:
- Multiple languages
- Symbols
- Emojis

---

# 📌 EXAMPLE

Supports:
- English
- Hindi
- Chinese
- Arabic

---

# 📘 UTF-8

UTF-8 is the most widely used Unicode format.

---

# 📌 FEATURES OF UTF-8

| Feature | Value |
|---|---|
| Variable Length | Yes |
| Compatible with ASCII | Yes |
| Internet Standard | Yes |

---

# 📘 DATA FORMATTING

Different systems represent data differently.

Presentation Layer standardizes:
- Text
- Images
- Audio
- Video

---

# 📌 EXAMPLES OF FORMATS

| Data Type | Formats |
|---|---|
| Image | JPEG, PNG |
| Audio | MP3, WAV |
| Video | MP4, AVI |
| Document | PDF, DOCX |

---

# 📘 ENCRYPTION

Encryption converts readable data into unreadable form.

---

# 📌 WHY ENCRYPTION IS IMPORTANT?

Protects data from:
- Hackers
- Attackers
- Unauthorized access

---

# 📌 ENCRYPTION PROCESS

```text
Plain Text
    ↓
Encryption
    ↓
Cipher Text
```

---

# 📌 EXAMPLE

Original Message:
```text
HELLO
```

Encrypted:
```text
XJ29Q
```

---

# 📘 DECRYPTION

Decryption converts encrypted data back into original form.

---

# 📌 PROCESS

```text
Cipher Text
     ↓
Decryption
     ↓
Original Data
```

---

# 📘 TYPES OF ENCRYPTION

```text
Encryption
│
├── Symmetric Encryption
└── Asymmetric Encryption
```

---

# 📘 SYMMETRIC ENCRYPTION

Same key used for:
- Encryption
- Decryption

---

# 📌 EXAMPLE

```text
Encryption Key = Decryption Key
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
| DES | Older encryption |
| AES | Modern secure encryption |

---

# 📘 AES (ADVANCED ENCRYPTION STANDARD)

Most widely used symmetric encryption algorithm.

---

# 📌 FEATURES

| Feature | Value |
|---|---|
| Key Sizes | 128, 192, 256 bits |
| Security | Very High |
| Speed | Fast |

---

# 📘 ASYMMETRIC ENCRYPTION

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

- More secure
- Solves key sharing problem

---

# 📌 DISADVANTAGES

- Slower

---

# 📌 COMMON ALGORITHMS

| Algorithm | Description |
|---|---|
| RSA | Widely used |
| ECC | Efficient modern encryption |

---

# 📘 RSA ALGORITHM

RSA is a popular public-key encryption algorithm.

Named after:
```text
Rivest, Shamir, Adleman
```

---

# 📌 USES OF RSA

- HTTPS
- Digital signatures
- Secure communication

---

# 📘 DIGITAL SIGNATURE

Digital signature verifies:
- Sender identity
- Data integrity

---

# 📌 WORKING

```text
1. Sender signs message
2. Receiver verifies signature
```

---

# 📌 PURPOSES

- Authentication
- Integrity
- Non-repudiation

---

# 📘 SSL/TLS

SSL/TLS provides secure communication over Internet.

---

# 📌 FULL FORM

| Protocol | Full Form |
|---|---|
| SSL | Secure Sockets Layer |
| TLS | Transport Layer Security |

---

# 📌 USES

- HTTPS
- Online banking
- Secure login systems

---

# 📌 WORKING

```text
Client ↔ Server
       ↓
Secure encrypted communication
```

---

# 📘 HTTPS

HTTPS =

```text
HTTP + SSL/TLS
```

---

# 📌 BENEFITS OF HTTPS

- Secure communication
- Data confidentiality
- Prevents eavesdropping

---

# 📘 COMPRESSION

Compression reduces data size.

---

# 📌 WHY COMPRESSION IS IMPORTANT?

Benefits:
- Faster transmission
- Less storage
- Reduced bandwidth usage

---

# 📌 EXAMPLE

Original File:
```text
100 MB
```

Compressed File:
```text
20 MB
```

---

# 📘 TYPES OF COMPRESSION

```text
Compression
│
├── Lossless Compression
└── Lossy Compression
```

---

# 📘 LOSSLESS COMPRESSION

No data lost during compression.

Original data restored exactly.

---

# 📌 EXAMPLES

| Format | Type |
|---|---|
| ZIP | Lossless |
| PNG | Lossless |

---

# 📌 ADVANTAGES

- Perfect recovery
- No quality loss

---

# 📘 LOSSY COMPRESSION

Some data permanently removed.

---

# 📌 EXAMPLES

| Format | Type |
|---|---|
| JPEG | Lossy |
| MP3 | Lossy |

---

# 📌 ADVANTAGES

- Smaller file size

---

# 📌 DISADVANTAGES

- Quality reduction

---

# 📘 COMPRESSION VS ENCRYPTION

| Compression | Encryption |
|---|---|
| Reduces size | Secures data |
| Improves speed | Improves privacy |
| No security | Security focused |

---

# 📘 MULTIMEDIA DATA HANDLING

Presentation Layer handles:
- Audio formatting
- Video formatting
- Image encoding

---

# 📌 EXAMPLES

| Multimedia Type | Formats |
|---|---|
| Audio | MP3, AAC |
| Video | MP4, AVI |
| Image | PNG, JPEG |

---

# 📘 MIME (MULTIPURPOSE INTERNET MAIL EXTENSIONS)

MIME allows email systems to send:
- Images
- Audio
- Video
- Documents

---

# 📌 EXAMPLE MIME TYPES

| MIME Type | Purpose |
|---|---|
| text/plain | Plain text |
| image/jpeg | JPEG image |
| application/pdf | PDF file |

---

# 📘 DATA CONVERSION

Presentation Layer converts:
- Big-endian ↔ Little-endian
- Character formats
- Multimedia representations

---

# 📘 BIG-ENDIAN VS LITTLE-ENDIAN

---

# 🔹 BIG-ENDIAN

Most significant byte stored first.

---

# 🔹 LITTLE-ENDIAN

Least significant byte stored first.

---

# 📌 EXAMPLE

Number:
```text
0x12345678
```

Big-endian:
```text
12 34 56 78
```

Little-endian:
```text
78 56 34 12
```

---

# 📘 PRESENTATION LAYER IN REAL APPLICATIONS

---

# 📌 1. WEB BROWSERS

Handles:
- HTML formatting
- HTTPS encryption
- Multimedia decoding

---

# 📌 2. VIDEO STREAMING

Handles:
- Video compression
- Audio encoding

Examples:
- YouTube
- Netflix

---

# 📌 3. SECURE BANKING

Handles:
- SSL/TLS encryption
- Secure login communication

---

# 📌 4. FILE COMPRESSION SOFTWARE

Examples:
- WinRAR
- ZIP

---

# 📘 SECURITY FEATURES

Presentation Layer contributes to:
- Confidentiality
- Integrity
- Secure communication

---

# 📌 COMMON SECURITY THREATS

```text
Threats
│
├── Eavesdropping
├── Data Theft
├── MITM Attack
└── Unauthorized Access
```

---

# 📘 MAN-IN-THE-MIDDLE (MITM) ATTACK

Attacker secretly intercepts communication.

---

# 📌 EXAMPLE

```text
Client ↔ Attacker ↔ Server
```

---

# 📘 PREVENTION OF MITM

- HTTPS
- SSL/TLS
- Encryption
- Digital certificates

---

# 📘 IMPORTANT DIFFERENCES

---

# 🔹 ASCII VS UNICODE

| ASCII | Unicode |
|---|---|
| 128 characters | Millions of characters |
| English only | Multiple languages |

---

# 🔹 SYMMETRIC VS ASYMMETRIC ENCRYPTION

| Symmetric | Asymmetric |
|---|---|
| One key | Two keys |
| Faster | Slower |
| Less secure sharing | More secure |

---

# 🔹 LOSSLESS VS LOSSY COMPRESSION

| Lossless | Lossy |
|---|---|
| No data loss | Some data loss |
| Better quality | Smaller size |

---

# 📌 ADVANTAGES OF PRESENTATION LAYER

- Standardized communication
- Data security
- Reduced file size
- Multi-format support

---

# 📌 DISADVANTAGES OF PRESENTATION LAYER

- Additional processing overhead
- Increased complexity

---

# 📌 IMPORTANT TERMS

| Term | Meaning |
|---|---|
| Encryption | Securing data |
| Compression | Reducing size |
| Encoding | Binary representation |
| Cipher Text | Encrypted data |
| Digital Signature | Sender verification |

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ Encryption vs Decryption  
⭐ Symmetric vs Asymmetric Encryption  
⭐ SSL/TLS  
⭐ HTTPS  
⭐ Compression Types  
⭐ ASCII vs Unicode  
⭐ Digital Signature  
⭐ MIME  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is the role of Presentation Layer?

Handles data formatting, encryption, and compression.

---

## Q2. Difference between encryption and compression?

Encryption secures data while compression reduces size.

---

## Q3. What is SSL/TLS?

Protocols providing secure communication.

---

## Q4. Difference between symmetric and asymmetric encryption?

Symmetric uses one key while asymmetric uses two keys.

---

## Q5. What is UTF-8?

A widely used Unicode encoding standard.

---

# 📌 LAST MINUTE REVISION

```text
Presentation Layer
│
├── Translation
├── Encoding
│   ├── ASCII
│   ├── Unicode
│   └── UTF-8
│
├── Encryption
│   ├── Symmetric
│   └── Asymmetric
│
├── SSL/TLS
├── HTTPS
│
├── Compression
│   ├── Lossless
│   └── Lossy
│
└── Multimedia Formatting
```

---