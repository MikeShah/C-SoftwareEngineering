// @file server.d
import std.socket;
import std.stdio;

import Packet : Packet;


void main(){

    auto listener = new Socket(AddressFamily.INET, SocketType.STREAM);


    string host = "localhost";
    ushort port = 5000;
    listener.bind(new InternetAddress(host,port));

    // Allow 4 connections to be queued up
    listener.listen(4);

    auto readSet = new SocketSet();
    Socket[] connectedClientsList;

    // Message buffer will be large enough to send/receive Packet.sizeof
    char[Packet.sizeof] buffer;

    // Main application loop for the server
    bool serverIsRunning=true;
    while(serverIsRunning){
        readSet.reset();
        readSet.add(listener);
        foreach(client ; connectedClientsList){
            readSet.add(client);
        }
        
        // Handle each clients message
        if(Socket.select(readSet, null, null)){
            foreach(client; connectedClientsList){
                if(readSet.isSet(client)){
                    // read from it and echo it back
                    auto got = client.receive(buffer);
                    client.send(buffer[0 .. got]);
                }
            }
        }
        // The listener is ready to read
        // Client wants to connect so we accept here.
        if(readSet.isSet(listener)){
            auto newSocket = listener.accept();
            // Add a new client to the list
            connectedClientsList ~= newSocket;
        }
    }
}
