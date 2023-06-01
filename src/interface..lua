---this contains the network interfaces (modem, tunnel, loopback, bridge, etc)
local component = require("component")
local event = require("event")

--- the default interface variables
local interface = {
    packetsIn = 0,
    packetsOut = 0,
    bytesIn = 0,
    bytesOut = 0,

    id = nil,
    name = nil,
    type = nil,
}

--- the interfaces should include the following functions:
--- new() - creates a new interface
--- send() - sends a packet
--- handleRecv() - receives a packet
--- getInfo() - returns the interface info

--- the modem interface

