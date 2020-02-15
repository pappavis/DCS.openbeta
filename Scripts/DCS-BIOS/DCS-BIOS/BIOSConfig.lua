BIOS.protocol_io.connections = {
	BIOS.protocol_io.DefaultMulticastSender:create(),
	BIOS.protocol_io.TCPServer:create(),
	BIOS.protocol_io.UDPSender:create({ port = 7777, host = "10.0.0.4" }),
	BIOS.protocol_io.UDPListener:create({ port = 7778 })
}
