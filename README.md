# Rover Communication Simulation (MATLAB)

This repository contains a MATLAB-based simulation for testing **rover communication reliability**.  
It models an **event-driven threat packet communication system** with **random delay** and **packet loss**, similar to real wireless rover networks.

---

## 📂 Files in this Repo

- **`rover_comm_sim.m`**  
  Main MATLAB simulation script.

- **`threat_packet_log.csv`**  
  Generated output log containing packet-wise details (delay, delivery/dropped status, coordinates, confidence, timestamp).

- **`threat_delay_plot.png`**  
  Generated plot showing communication delay variation per packet.

---

## 🎯 Objective

To simulate how threat detection packets are transmitted to a rover under real-world network conditions such as:

- Communication delay
- Packet drop (loss)
- Event-based transmission (not continuous streaming)

---

## ⚙️ Requirements

- MATLAB (Recommended: MATLAB R2025b or later)
- No additional toolboxes required

---

## 🚀 How to Run

### 1. Clone the Repository
```bash
git clone <YOUR_GITHUB_REPO_LINK>
cd <REPO_FOLDER>
```

### 2. Open MATLAB

Start MATLAB normally.

### 3. Set current folder

In MATLAB, open the folder containing rover_comm_sim.m.

OR run this in MATLAB:
```bash
cd('path_to_repo_folder')
```
### 4. Run the Script
```bash
rover_comm_sim
```

### 🖥️ What You Will See in Output
Packet Transmission Logs

Each packet prints:
```bash
Threat coordinates (x, y)

Confidence score

Delay (seconds)

Status (DELIVERED or DROPPED)
```

### Example:
```bash
[Packet 1] (x=82,y=91,conf=0.13) Delay=1.38s STATUS=DELIVERED
[Packet 2] (x=9,y=28,conf=0.55) Delay=1.44s STATUS=DELIVERED
```

### 📊 Performance Metrics Generated

At the end of execution, MATLAB prints:
```bash
Total packets sent

Packets delivered

Packets dropped

Packet loss rate (%)

Average delay (seconds)

Maximum delay (seconds)
```
### Example:
```bash
Sent: 30
Delivered: 21
Dropped: 9
Loss Rate: 30.00%
Avg Delay: 0.85s
```

### 📈 Plot Output

A graph is generated showing delay per packet:

X-axis: Packet Number

Y-axis: Delay (seconds)

This plot is saved automatically as:

threat_delay_plot.png

### 🗂️ CSV Output Log

The simulation also generates a CSV file:

threat_packet_log.csv

This contains packet-wise data including:
```bash
PacketID

X coordinate

Y coordinate

Confidence

Timestamp

DelaySeconds

Status
```
### 🧠 Project Use Case

This simulation helps validate rover communication reliability by modeling realistic wireless communication behavior:

Delay variation

Packet drop probability

Event-driven message sending

This is useful for designing embedded rover systems where safety and real-time communication are critical.
