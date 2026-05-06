# 📘 SESSION LAYER (LAYER 5)

---

# 📌 INTRODUCTION TO SESSION LAYER

The Session Layer is the **5th layer** of the OSI Model.

It is responsible for:
- Establishing sessions
- Managing sessions
- Synchronizing communication
- Terminating sessions

The Session Layer acts like a:
```text
Conversation manager between applications.
```

---

# 📌 POSITION OF SESSION LAYER IN OSI MODEL

```text
+-------------------+
| 7. Application    |
+-------------------+
| 6. Presentation   |
+-------------------+
| 5. Session Layer  |
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

# 📌 MAIN PURPOSE OF SESSION LAYER

The Session Layer controls:
```text
Who communicates,
When communication starts,
How long communication continues,
And when communication ends.
```

---

# 📌 REAL LIFE ANALOGY

Suppose two people are having a phone call.

| Networking Concept | Real Life Example |
|---|---|
| Session Establishment | Starting phone call |
| Session Management | Talking continuously |
| Synchronization | Continuing after interruption |
| Session Termination | Ending call |

The Session Layer acts like:
```text
Call manager of communication.
```

---

# 📌 MAIN FUNCTIONS OF SESSION LAYER

| Function | Description |
|---|---|
| Session Establishment | Starts communication |
| Session Maintenance | Keeps session active |
| Session Termination | Ends communication |
| Synchronization | Adds checkpoints |
| Dialog Control | Controls who sends data |
| Token Management | Prevents simultaneous access |

---

# 📘 SESSION ESTABLISHMENT

Before communication:
- A session must be created.

---

# 📌 EXAMPLE

When you log into:
- Gmail
- WhatsApp Web
- Banking application

A session is established between:
```text
Client ↔ Server
```

---

# 📌 PROCESS

```text
Client Requests Session
          ↓
Server Accepts Session
          ↓
Communication Starts
```

---

# 📘 SESSION MAINTENANCE

During communication:
- Session Layer keeps track of communication state.

It ensures:
- Session remains active
- Communication continues smoothly

---

# 📌 EXAMPLE

While watching Netflix:
- Session Layer maintains streaming session.

---

# 📘 SESSION TERMINATION

After communication completes:
- Session is closed properly.

---

# 📌 EXAMPLE

When you:
```text
Logout from website
```

Session terminates.

---

# 📌 TERMINATION PROCESS

```text
Communication Ends
        ↓
Resources Released
        ↓
Session Closed
```

---

# 📘 DIALOG CONTROL

Dialog Control decides:
```text
Who can transmit data and when?
```

---

# 📌 TYPES OF COMMUNICATION

```text
Dialog Modes
│
├── Half Duplex
└── Full Duplex
```

---

# 🔹 HALF DUPLEX

Only one side communicates at a time.

---

## 📌 EXAMPLE

- Walkie Talkie

---

# 🔹 FULL DUPLEX

Both sides communicate simultaneously.

---

## 📌 EXAMPLE

- Video calls
- Phone calls

---

# 📘 TOKEN MANAGEMENT

Suppose multiple users try accessing same resource.

Token Management ensures:
```text
Only one user accesses resource at a time.
```

---

# 📌 EXAMPLE

Shared printer in office.

Only one computer can print at a time.

---

# 📘 SYNCHRONIZATION

Large data transfer may fail due to:
- Network failure
- System crash
- Power failure

Session Layer uses:
```text
Synchronization Points (Checkpoints)
```

---

# 📌 WHY SYNCHRONIZATION IS IMPORTANT?

Without synchronization:
- Entire transfer restarts from beginning.

With synchronization:
- Transfer resumes from checkpoint.

---

# 📌 EXAMPLE

Suppose:
```text
10 GB file transfer
```

Checkpoint after every:
```text
1 GB
```

If failure occurs at:
```text
7 GB
```

Transfer resumes from:
```text
6 GB checkpoint
```

instead of restarting from 0 GB.

---

# 📌 SYNCHRONIZATION FLOW

```text
Start Transfer
      ↓
Checkpoint 1
      ↓
Checkpoint 2
      ↓
Failure Occurs
      ↓
Resume from Last Checkpoint
```

---

# 📘 SESSION LAYER SERVICES

| Service | Description |
|---|---|
| Authentication | Verifies users |
| Authorization | Access permissions |
| Session Recovery | Restores interrupted session |
| Session Logging | Tracks session activity |

---

# 📘 SESSION IDENTIFIERS

Each session gets unique:
```text
Session ID
```

Used to:
- Identify session
- Resume communication
- Maintain state

---

# 📌 EXAMPLE

When you log into website:
```text
Session ID stored in cookies
```

---

# 📘 STATEFUL VS STATELESS COMMUNICATION

---

# 🔹 STATEFUL COMMUNICATION

Server remembers previous communication.

---

## 📌 EXAMPLE

Online banking login session.

---

# 🔹 STATELESS COMMUNICATION

Server does not remember previous requests.

Each request independent.

---

## 📌 EXAMPLE

Basic HTTP request.

---

# 📌 STATEFUL VS STATELESS TABLE

| Stateful | Stateless |
|---|---|
| Session remembered | No memory |
| More overhead | Lightweight |
| More secure tracking | Faster |

---

# 📘 SESSION LAYER IN REAL APPLICATIONS

---

# 📌 1. VIDEO CONFERENCING

Session Layer:
- Maintains video session
- Handles interruptions

Examples:
- Zoom
- Google Meet

---

# 📌 2. ONLINE GAMING

Maintains:
- Player sessions
- Real-time communication

---

# 📌 3. ONLINE BANKING

Maintains:
- Secure login sessions
- Timeout handling

---

# 📌 4. FILE TRANSFER

Uses checkpoints during large transfers.

---

# 📘 SESSION TIMEOUT

If inactive for long time:
- Session automatically closes.

---

# 📌 WHY SESSION TIMEOUT IS IMPORTANT?

Improves:
- Security
- Resource management

---

# 📌 EXAMPLE

Banking websites:
```text
Auto logout after inactivity
```

---

# 📘 SESSION LAYER PROTOCOLS

Some protocols related to Session Layer:

| Protocol | Purpose |
|---|---|
| NetBIOS | Session communication |
| PPTP | VPN sessions |
| RPC | Remote procedure calls |
| SIP | Multimedia sessions |

---

# 📘 REMOTE PROCEDURE CALL (RPC)

RPC allows one computer to execute function on another computer.

---

# 📌 EXAMPLE

Client:
```text
Requests remote calculation
```

Server:
```text
Performs operation and returns result
```

---

# 📘 NETBIOS

NetBIOS provides:
- Session communication
- File sharing
- Printer sharing

Mostly used in:
- Windows networking

---

# 📘 SESSION SECURITY

Session Layer contributes to security by:
- Session authentication
- Session timeout
- Session tracking

---

# 📌 COMMON SESSION ATTACKS

```text
Session Attacks
│
├── Session Hijacking
├── Session Fixation
└── Replay Attack
```

---

# 📘 SESSION HIJACKING

Attacker steals session ID and gains unauthorized access.

---

# 📌 EXAMPLE

Stealing:
```text
Session cookie
```

from browser.

---

# 📘 SESSION FIXATION

Attacker forces victim to use predefined session ID.

---

# 📘 REPLAY ATTACK

Attacker reuses captured communication.

---

# 📘 SESSION SECURITY TECHNIQUES

| Technique | Purpose |
|---|---|
| HTTPS | Encrypt session |
| Session Timeout | Reduce misuse |
| Random Session IDs | Prevent guessing |
| MFA | Additional security |

---

# 📘 SESSION FLOW OVERVIEW

```text
Client Requests Session
          ↓
Session Established
          ↓
Data Exchange
          ↓
Synchronization
          ↓
Session Maintained
          ↓
Communication Ends
          ↓
Session Terminated
```

---

# 📘 IMPORTANT DIFFERENCES

---

# 🔹 SESSION LAYER VS TRANSPORT LAYER

| Session Layer | Transport Layer |
|---|---|
| Manages sessions | Manages data transport |
| Synchronization | Reliability |
| Dialog control | Flow control |

---

# 🔹 SESSION VS CONNECTION

| Session | Connection |
|---|---|
| Logical conversation | Physical communication |
| Managed by Session Layer | Managed by Transport Layer |

---

# 📌 ADVANTAGES OF SESSION LAYER

- Organized communication
- Session recovery
- Synchronization support
- Better user management

---

# 📌 DISADVANTAGES OF SESSION LAYER

- Additional overhead
- Complexity
- Resource usage

---

# 📌 IMPORTANT TERMS

| Term | Meaning |
|---|---|
| Session | Communication instance |
| Checkpoint | Recovery point |
| Session ID | Unique session identifier |
| Dialog Control | Communication coordination |

---

# 📌 VERY IMPORTANT EXAM TOPICS

⭐ Session Establishment  
⭐ Session Maintenance  
⭐ Session Termination  
⭐ Synchronization  
⭐ Dialog Control  
⭐ Session Timeout  
⭐ Stateful vs Stateless  
⭐ Session Hijacking  

---

# 📌 INTERVIEW QUESTIONS

---

## Q1. What is the role of Session Layer?

Session Layer establishes, manages, and terminates sessions between applications.

---

## Q2. What is synchronization in Session Layer?

Adding checkpoints to recover interrupted communication.

---

## Q3. What is session timeout?

Automatic session termination after inactivity.

---

## Q4. Difference between stateful and stateless communication?

Stateful remembers previous interactions while stateless does not.

---

## Q5. What is session hijacking?

Unauthorized takeover of active session.

---

# 📌 LAST MINUTE REVISION

```text
Session Layer
│
├── Session Establishment
├── Session Maintenance
├── Session Termination
├── Synchronization
├── Dialog Control
├── Token Management
├── Session Timeout
└── Session Security
```
---