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

    ---actuall stuff (component vars)
    compID = nil,
    proxy = nil,
}
interface.__index = interface

--- the interfaces should include the following functions:
--- new() - creates a new interface
--- send() - sends a packet
--- handleRecv() - receives a packet
--- getInfo() - returns the interface info

--- the modem interface
local modemInterface = interface

--- modemInter Constructor
function modemInterface.new(proxy, name, id)
    local self = setmetatable({}, modemInterface)
    if component.type(proxy.address) ~= "modem" then
        return
    end

    self.id = id
    self.proxy = proxy
    self.compID = proxy.address

    self.name = name
    self.type = "modem"

    return self
end

--- modemInter send
function modemInterface:send(packet)
    self.proxy.send(packet)
    self.packetsOut = self.packetsOut + 1
    self.bytesOut = self.bytesOut + packet:len()
end