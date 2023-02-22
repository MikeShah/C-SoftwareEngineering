import std.socket;
import std.stdio;

import Packet : Packet;

void main(){

    // Create a socket for connecting to a server
    auto socket = new Socket(AddressFamily.INET, SocketType.STREAM);
    // Connect to a server
    // Specific address and port must match
    socket.connect(new InternetAddress("localhost", 5000));

    // Buffer of data to send out
    char[Packet.sizeof] buffer;
    auto received = socket.receive(buffer);

    writeln("Server says: ", buffer[0 .. received]);
    foreach(line; stdin.byLine){
        Packet data;
        data.message="line";
        socket.send(data.GetPacket());
        writeln("Server said: ", buffer[0 .. socket.receive(buffer)]);
    }

}
