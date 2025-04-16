# 🧩 2x2 Ethernet Switch – SystemVerilog Functional Design

A synthesizable RTL model of a 2x2 Ethernet switch built in SystemVerilog. This design routes variable-length packets from input to output ports using destination address decoding, with FIFO buffering and SOP/EOP marker handling.

---

## ✨ Features

- **2x2 switching**: Two inputs and two outputs with 32-bit data paths  
- **Variable-length packets**: Handles packet sizes from 64B to 1518B  
- **FIFO buffering**: Independent FIFOs for each output port  
- **SOP/EOP support**: Detects Start and End of Packet markers  
- **Address-based routing**: Destination address (DA) decoded to choose output port  
- **Supports idle periods, back-to-back, and interleaved traffic**

---

## 📂 File Structure

| File / Folder | Description |
|---------------|-------------|
| `rtl/2x2_ethernet.sv` | Top-level module (wrapper for FIFOs and switch logic) |
| `rtl/2x2_switching_logic.sv` | Internal routing and output port selection |
| `rtl/FIFO.sv` | FIFO module used for packet buffering |
| `tb/2x2_ethernet_tb.sv` | Basic top-level testbench with functional stimulus |

---

## 🔄 Project Status

- ✅ RTL: Complete and modular  
- ✅ Testbench: Top-level functional testbench implemented  
- 🔜 Extensions: Burst mode and CRC check (future scope)

---

## 🧑‍💻 Author

**Ali Yusuf Askari Husain**  
M.Tech Microelectronics | RTL & Verification | Ex-Intel Intern  
📧 ali.yusuf.ay.110@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/ali-yusuf-73746a13a/)

---

## 🔗 Project Link

[GitHub Repo](https://github.com/aliyusufay/Ethernet-switch-2x2)
