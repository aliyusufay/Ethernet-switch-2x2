# 2x2 Ethernet Switch (SystemVerilog)

A functional RTL implementation of a 2x2 Ethernet packet switch, designed in SystemVerilog. The switch supports dynamic address-based routing with variable packet lengths, SOP/EOP markers, and FIFO buffering.

## ✨ Features

- Two input and two output ports (2x2) with 32-bit data paths
- Supports variable-length packets (64B–1518B) with SOP/EOP handling
- Per-port FIFO buffering for back-to-back or bursty traffic
- Dynamic destination routing based on destination address (DA)
- Modular design with top-level FSM and switching logic separated
- Basic self-checking testbench at top-level

## 📂 File Structure

| File/Folder | Description |
|-------------|-------------|
| `rtl/2x2_ethernet.sv` | Top module instantiating FIFOs and switching logic |
| `rtl/2x2_switching_logic.sv` | Routing logic and DA decode |
| `rtl/FIFO.sv` | FIFO implementation for buffering |
| `tb/2x2_ethernet_tb.sv` | Top-level testbench |

## ✅ Status

- Core logic: ✔️ Complete  
- Testbench: ✔️ Complete
- CRC and burst extension: 🔄 Future work

## 🚀 Author

Ali Yusuf Askari Husain  
M.Tech Microelectronics | RTL Design & Verification | Intel Intern  
📧 ali.yusuf.ay.110@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/ali-yusuf-73746a13a/)
