# OC-ip
A ipv4 like network system

dev notes:
protocol:
PacketStructure:

[TTL-byte][PROTOCOL-BYTE]:[SourceAddrLenByte][SAddress]:[DestAddrLenByte][DAddress]:[Data]

Protocols:
    0x00: ICMP
    0x01: ICMP_PING
    0x02: ICMP_PONG
    